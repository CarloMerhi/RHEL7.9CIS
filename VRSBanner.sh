#!/bin/bash

echo "Creating Banner..."
sed -i "s/\#Banner none/Banner \/etc\/issue\.net/" /etc/ssh/sshd_config
cp -p /etc/issue.net $AUDITDIR/issue.net_$TIME.bak
cat > /etc/issue.net << 'EOF'
/-------------------------------------------------------------------------\
|                       ---------- WARNING ----------                     |
|                                                                         |
| You are accessing a U.S. Government information system. By using this   |
| information system, you understand and consent to the following when you|
| access this U.S. agency's information system which includes (1) this    |
| computer, (2) this computer network, (3) all computers connected to     |
| this network, and (4) all devices and storage media attached to this    |
| network or to a computer on this network:, This information system is   |
| provided for U.S. Government-authorized use only. Unauthorized or  	  |
| improper use of this system may result in disciplinary action, as well  |
| as civil and criminal penalties. The Government, acting directly or     |
| through its contractors, routinely monitors communications occurring    |
| on this information system. You have no reasonable expectation of       |
| privacy regarding any communications or data transiting, or stored on   |
| , or traveling to or from this information system. At any time, the     |
| government may for any lawful government purpose monitor, intercept,    |
| search, and seize any communication or data transiting, stored, or      |
| traveling to or from this information system, and any communications    |
| or data transiting, stored on, or traveling to or from this information | 
| system may be disclosed or used for any lawful government purpose.      |
| Unauthorized use should be reported to the                              |
| VRS CISO at ciso@varetire.org.                                          |
\-------------------------------------------------------------------------/
EOF
cp -p /etc/motd /etc/motd_$TIME.bak
cat > /etc/motd << 'EOF'
VRS AUTHORIZED USE ONLY
EOF
rm -rf /etc/issue
ln -s /etc/issue.net /etc/issue
