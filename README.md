<div align="center">

# WK1-PM1 | Cybersecurity Virtual Lab

### VirtualBox • Kali Linux • Network Configuration

![Linux](https://img.shields.io/badge/Host-Linux-black?logo=linux)
![VirtualBox](https://img.shields.io/badge/Hypervisor-VirtualBox-blue?logo=virtualbox)
![Kali Linux](https://img.shields.io/badge/Guest-Kali%20Linux-557C94?logo=kalilinux)
![Internship](https://img.shields.io/badge/Internship-Week%2001-success)
![Status](https://img.shields.io/badge/Project-In%20Progress-orange)

**A documented cybersecurity testing lab built using Oracle VirtualBox and Kali Linux.**

</div>

---

## 1. Project Overview

This repository documents the planning, deployment, configuration,
and verification of a virtual cybersecurity testing environment.

The project was completed as part of my cybersecurity internship,
Week 1 — Project Module 1 (WK1-PM1).

The primary objective is to establish a dedicated Kali Linux
environment using Oracle VirtualBox, connected through a custom
NAT Network with a predefined IPv4 subnet.

This environment will serve as a foundation for future practical
exercises involving networking, reconnaissance, vulnerability
assessment, and authorized penetration testing.

## 2. Project Objectives

- Install and configure Oracle VirtualBox.
- Deploy Kali Linux as the primary testing machine.
- Create a custom NAT Network.
- Configure the network using `10.0.0.0/24`.
- Assign Kali Linux the static IP `10.0.0.2/24`.
- Configure the default gateway and DNS.
- Enable bidirectional clipboard functionality.
- Enable bidirectional drag and drop.
- Configure a shared host downloads folder.
- Establish and verify Internet connectivity.
- Create a clean VM snapshot.
- Document the implementation with technical evidence.

## 3. Lab Architecture

The lab uses a Linux host machine running Oracle VirtualBox.
Kali Linux operates as a guest virtual machine connected to
a dedicated NAT Network.

```text
                 INTERNET
                    |
             LINUX HOST MACHINE
                    |
              ORACLE VIRTUALBOX
                    |
                NatNetwork
                10.0.0.0/24
                    |
               KALI LINUX VM
                10.0.0.2/24
                    |
          CYBERSECURITY TEST LAB
```

### Network Configuration

| Component | Configuration |
|---|---|
| Host Operating System | Linux |
| Hypervisor | Oracle VirtualBox |
| Guest Operating System | Kali Linux |
| Network Type | NAT Network |
| Network Name | NatNetwork |
| IPv4 Subnet | `10.0.0.0/24` |
| Kali Static IP | `10.0.0.2/24` |
| Default Gateway | `10.0.0.1` |
| DNS Server | `8.8.8.8` |
| DHCP | Enabled on NAT Network |

## 4. Virtual Machine Integration

The following integration features are required:

| Feature | Configuration |
|---|---|
| Shared Clipboard | Bidirectional |
| Drag and Drop | Bidirectional |
| Shared Folder | Host `/downloads` |
| Auto-mount | Enabled |
| Network Adapter | NAT Network |
| Cable Connected | Enabled |

Guest integration features may require VirtualBox Guest Additions
or the appropriate guest integration packages.

## 5. Installation and Configuration

### Prerequisites

Recommended host specifications from the internship assignment:

- 8 GB RAM or more.
- 256 GB SSD or more.
- Intel Core i3/i5 or equivalent processor.

These are recommendations, not mandatory minimum requirements.

### Required Software

- Oracle VirtualBox
- Kali Linux Virtual Machine
- Archive extraction utility, if required

Official downloads:

- [Oracle VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Kali Linux](https://www.kali.org/get-kali/)

### Step 1 — Install VirtualBox

Download and install Oracle VirtualBox for the host Linux
distribution.

Verify the installation:

```bash
VBoxManage --version
```

### Step 2 — Deploy Kali Linux

1. Download the official Kali VirtualBox image.
2. Extract the archive if necessary.
3. Import the virtual machine into VirtualBox.
4. Review CPU, memory, and storage allocation.
5. Start Kali Linux.

### Step 3 — Configure NAT Network

Open VirtualBox Network settings and create a NAT Network
with the following configuration:

```text
Network Name: NatNetwork
IPv4 Prefix:  10.0.0.0/24
DHCP:         Enabled
```

### Step 4 — Configure Kali Network Adapter

Open Kali VM Settings → Network.

Configure:

- Enable Network Adapter.
- Attached to: NAT Network.
- Name: NatNetwork.
- Promiscuous Mode: Allow All.
- Cable Connected: Enabled.

### Step 5 — Configure Static IP

Identify the NetworkManager connection:

```bash
nmcli connection show
```

Configure the connection using the appropriate connection name:

```bash
sudo nmcli connection modify "Wired connection 1" \
  ipv4.method manual \
  ipv4.addresses 10.0.0.2/24 \
  ipv4.gateway 10.0.0.1 \
  ipv4.dns "8.8.8.8"
```

Reactivate the connection:

```bash
sudo nmcli connection down "Wired connection 1"
sudo nmcli connection up "Wired connection 1"
```

Replace the connection name if it differs on your system.

### Step 6 — Verify Network Configuration

```bash
ip -br address
ip route
nmcli device status
```

Test connectivity:

```bash
ping -c 4 10.0.0.1
ping -c 4 1.1.1.1
getent hosts www.kali.org
curl -I https://www.kali.org
```

### Step 7 — Configure VM Integration

Enable:

- Shared Clipboard: Bidirectional.
- Drag and Drop: Bidirectional.
- Shared Folder: Host `/downloads`.

Verify that the shared folder is accessible from Kali Linux.

### Step 8 — Create a Snapshot

After successful configuration and verification, create a
VirtualBox snapshot to preserve the initial lab environment.

Suggested snapshot name:

`Kali-Linux-Initial-Lab-Configuration`

---

## 6. Repository Structure

```text
WK1-PM1-Kali-Linux-Virtual-Lab/
│
├── README.md
├── LICENSE
├── .gitignore
│
├── docs/
│   ├── architecture.md
│   ├── installation.md
│   ├── network-configuration.md
│   └── troubleshooting.md
│
├── screenshots/
│   ├── 01-virtualbox-installation/
│   ├── 02-nat-network/
│   ├── 03-kali-vm-settings/
│   ├── 04-network-configuration/
│   ├── 05-connectivity-tests/
│   └── 06-snapshots/
│
├── scripts/
│   ├── system-info.sh
│   └── network-check.sh
│
└── reports/
    └── lab-verification.md
```

## 7. Implementation Evidence

Screenshots will be added as the environment is configured and
verified.

### VirtualBox Installation

<!-- Add your VirtualBox screenshot here -->

### NAT Network Configuration

<!-- Add your NAT Network screenshot here -->

### Kali Linux VM Settings

<!-- Add your VM configuration screenshot here -->

### Network Configuration

<!-- Add your Kali IP configuration screenshot here -->

### Connectivity Testing

<!-- Add your successful connectivity test screenshot here -->

### VM Snapshot

<!-- Add your snapshot screenshot here -->

---

## 8. Verification and Testing

The following tests are required before considering the lab complete.

| Test | Expected Result | Status |
|---|---|---|
| VirtualBox installation | Installed | Pending |
| NAT Network | `10.0.0.0/24` | Pending |
| Kali static IP | `10.0.0.2/24` | Pending |
| Default gateway | `10.0.0.1` | Pending |
| Gateway connectivity | Successful | Pending |
| External connectivity | Successful | Pending |
| DNS resolution | Successful | Pending |
| HTTPS connectivity | Successful | Pending |
| Shared folder | Accessible | Pending |
| Clipboard | Bidirectional | Pending |
| Drag and drop | Bidirectional | Pending |
| VM snapshot | Created | Pending |

Actual results and observations will be documented in:

`reports/lab-verification.md`

## 9. Troubleshooting

### No Internet Connectivity

Check:

1. NAT Network configuration.
2. Kali network adapter settings.
3. Cable Connected status.
4. IP address and gateway.
5. DNS resolution.
6. Duplicate IP addresses.

### NetworkManager Connectivity Workaround

For affected VirtualBox 7 and Kali Linux 2026.1 or newer
installations, the internship assignment provides this workaround:

```bash
sudo nmcli connection modify "Wired connection 1" ipv4.dad-timeout 0
sudo nmcli connection down "Wired connection 1"
sudo nmcli connection up "Wired connection 1"
```

Confirm the actual connection name before executing.

### Shared Folder Issues

- Verify the VirtualBox shared folder configuration.
- Check Auto-mount.
- Verify Guest Additions or guest integration packages.
- Check Linux permissions and group membership.

Additional troubleshooting information:

[docs/troubleshooting.md](docs/troubleshooting.md)

## 10. Future Improvements

This lab will provide the foundation for additional cybersecurity
practical exercises, including:

- Additional Windows virtual machines.
- Vulnerable testing environments.
- Internal network discovery.
- Service enumeration.
- Vulnerability assessment.
- Controlled penetration testing.
- Capture The Flag environments.

Additional machines will be isolated within the intended lab
network and used only for authorized exercises.

## 11. Responsible Use

This environment is designed for cybersecurity education,
authorized testing, and ethical hacking practice.

All security testing must be performed on systems for which
explicit permission has been granted.

## 12. Project Information

| Field | Details |
|---|---|
| Project ID | WK1-PM1 |
| Program | Cybersecurity Internship |
| Week | 01 |
| Author | Ahmad Sultan |
| Main Platform | Linux |
| Hypervisor | Oracle VirtualBox |
| Guest OS | Kali Linux |

---

<div align="center">

**Built for learning. Configured for testing. Documented with evidence.**

</div>
