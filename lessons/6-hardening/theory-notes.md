# Hardening

1.  What is meant by the term hardening? Why are defaults often not ok?
2.  Explain short, no details, what the following things are and why they exist:

    -   CIS Benchmark: The CIS Benchmarks are secure configuration settings for over 100 technologies, available as a free PDF download.
    -   OpenSCAP: Tools to assist administrators and auditors with assessment, measurement and enforcement of security baselines
    -   Lynis: Lynis can detect vulnerabilities and configuration flaws. Where a typical vulnerability scanner will just point out vulnerabilities, Lynis aims for an in-depth audit and continuous improvement.
    -   Microsoft Security Compliance Toolkit: The Microsoft Security Compliance Toolkit is a set of tools that allows enterprise security administrators to download, analyze, test, edit, and store Microsoft-recommended security configuration baselines for Windows and other Microsoft products.
    -   Docker Bench: The Docker Bench for Security is a script that checks for dozens of common best-practices around deploying Docker containers in production.
    -   Maester: Maester is a PowerShell based test automation framework to help you stay in control of your Microsoft security configuration.
    -   dev-sec.io: dev-sec.io is a collection of Chef InSpec profiles that can be used to secure your infrastructure.

3.  What is OpenSCAP? (No details)
4.  What is Lynis? (No details)
5.  What is meant by threat hunting

        Threat hunting is the process of proactively and iteratively searching through networks to detect and isolate advanced threats that evade existing security solutions. The goal of threat hunting is to identify and stop attackers before they can cause damage or steal sensitive data.

    -   Explain (no details) what is meant by threat modeling

        Threat modeling is a process by which potential threats can be identified, enumerated, and prioritized, all from a hypothetical attacker's point of view. The purpose of threat modeling is to provide defenders with a systematic analysis of the probable attacker's profile, the most likely attack vectors, and the assets most desired by an attacker.

6.  Why do some people call Ansible a tool suitable for hardening but also for hunting?

        Ansible is a tool that can be used to automate the hardening process, as well as the threat hunting process. Ansible playbooks can be used to automate the process of applying security configurations to systems, as well as to automate the process of searching for threats on a network.
