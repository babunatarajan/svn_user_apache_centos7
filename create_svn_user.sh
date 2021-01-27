#!/usr/bin/env bash

svn_repo_prj="/svn/repo1"
svn_user="testuser"
svn_pass="Covid19"

htpasswd -b /etc/subversion/svn.users $svn_user $svn_pass
svnadmin create $svn_repo_prj
chown -R apache.apache $svn_repo_prj
chcon -R -t httpd_sys_content_t $svn_repo_prj
chcon -R -t httpd_sys_rw_content_t $svn_repo_prj
systemctl restart httpd.service

echo "If needed change the port (8800) and run the following command"
echo "cd /tmp"
echo "svn co http://localhost:8800/$svn_repo_prj"
