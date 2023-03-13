## About

This project provisions fresh Kali virtual machines with additional tools and utilities for use in a few areas: CTFs, boxes, and some baseline utilities for bug bounty hunting (that part is more of a WIP). Sources here were chosen from a combination of a red team specific Golden-Kali image from a competition, and additional tooling (Rust, Fish, and a few others) from Michael Taggart's Practical Web Application Security course. The provisioning is handled entirely though an Ansible playbook.

**Future plans**: The current iteration of this playbook is straightforward and not modular. Updates may include creating role based playbooks to allow for smaller builds for specific use cases (e.g. not adding in additional tools like Node for Javascript work). Otherwise I'm primarily expecting to add and/or prune the included packages based on what I'm using regularly (or not).

### Getting started

Instructions here are assuming you have a fresh install of Kali.

1. Clone the repo to your Kali install
1. `cd` into the directory
1. Run `sudo ./setup.sh` to install Ansible and run the playbook.
1. Let the script run. This will take a **while**. In my experience up to a couple of hours due to the initial `apt update` and package installs.

NOTE: this script is currently only intended for single-user installs. If you have multiple users this will not create the `~/Scripts` directory and add in SecLists, stego-toolkit, or the Powerline fonts to that user's home.