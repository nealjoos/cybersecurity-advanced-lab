# IDS/IPS

1. What is the difference between an IDS and an IPS?

    IDS (Intrusion Detection System) is a passive system that monitors network traffic for suspicious activity and alerts the network administrator. An IPS (Intrusion Prevention System) is an active system that monitors network traffic for suspicious activity and can take action to prevent it.

2. What are some fundamental differences between a firewall and an IDS/IPS, conceptually?

    A firewall is a network security system that monitors and controls incoming and outgoing network traffic based on predetermined security rules. An IDS/IPS is a system that monitors network traffic for suspicious activity and alerts the network administrator or takes action to prevent it.

3. Create, understand and interpret some basic suricata rules:

    - A rule that can detect a specific protocol

        ```yaml
        alert tcp any any -> any any (msg:"TCP traffic detected"; sid:1000001;)
        ```

    - A rule that can detect traffic using a specific port

        ```yaml
        alert tcp any any -> any 80 (msg:"HTTP traffic detected"; sid:1000002;)
        ```

4. Imagine having a physical IDS/IPS device. Where would you place it in the network if it would be separate from your firewall? How would you set this up? What is the impact on the network by adding this device?

    You would place the IDS/IPS device between the firewall and the internal network. This would allow the IDS/IPS device to monitor all incoming and outgoing traffic. The impact on the network would be minimal, as the IDS/IPS device would be passively monitoring traffic.

5. What is security onion? What is the goal? You should be able to properly explain what security onion is. The Security Onion has placed an excellent introduction for beginners on YouTube.

    Security Onion is a Linux distribution for intrusion detection, network security monitoring, and log management. The goal of Security Onion is to provide a comprehensive platform for network security monitoring.
