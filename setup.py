import os
import yaml
import grp

def dnf_section(elements):
    command = "sudo dnf install --allowerasing " + " ".join(elements)
    os.system(command)
    return
    
def commands_section(elements):
    for entry in elements:
        os.system(entry)
    return
    
def copr_section(elements):
    for entry in elements:
        os.system(f"sudo dnf copr enable -y {entry}")
    return

def flatpak_section(elements):
    command = "flatpak install -y " + " ".join(elements)
    os.system(command)
    return

def dconf_section(elements):
    for entry in elements:
        command = f"dconf write {entry['key']} \"{entry['value']}\""
        os.system(command)
    return

def download_section(elements):
    current_dir = os.getcwd()
    for entry in elements:
        entry['dst'] = os.path.join(os.environ['HOME'], entry['dst'])
        print(f"Downloading {entry['src']} into {entry['dst']}")
        os.system(f"mkdir -p {entry['dst']}")
        os.chdir(entry['dst'])
        os.system(f"wget '{entry['src']}'")
        if entry['command'] != "":
            os.system(entry['command'])
        os.chdir(current_dir)
    return

def services_section(elements):
    for entry in elements:
        command = f"systemctl enable {entry} && systemctl start {entry}"
        print(f"Enabling and starting {entry} service")
        os.system(command)
    return
    
def stow_section(elements):
    for entry in elements:
        command = f"stow -t ~ {entry}"
        print(f"Creating symlink for {entry}")
        os.system(command)
    return
    
def groups_section(elements):
    for entry in elements:
        if entry not in [grp.getgrgid(g).gr_name for g in os.getgroups()]:
            print(f"Adding user to {entry} group")
            os.system(f"sudo usermod -aG {entry} $USER")
        else:
            print(f"User already in {entry} group")
    return
    
def hostname_section(elements):
    os.system(f"hostnamectl hostname {elements}")
    return

def main():
    stream = open("data.yml", "r")
    data = yaml.safe_load(stream)
    for section, elements in data.items():
        print(f"Section {section}")
        match section:
            case "dnf":
                dnf_section(elements)
            case "commands":
                commands_section(elements)
            case "copr":
                copr_section(elements)
            case "flatpak":
                flatpak_section(elements)
            case "dconf":
                dconf_section(elements)
            case "download":
                download_section(elements)
            case "services":
                services_section(elements)
            case "stow":
                stow_section(elements)
            case "groups":
                groups_section(elements)
            case "hostname":
                hostname_section(elements)
            case _:
                print(f"Section {section} does not exist!")
    stream.close()

if __name__ == '__main__':
    main()
