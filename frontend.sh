log_file=/tmp/expense.log

echo installing nginx
dnf install nginx -y >>$log_file
cp expense.conf /etc/nginx/default.d/expense.conf



echo removing old contant
rm -rf /usr/share/nginx/html/* >>$log_file

echo downloding frontend contant
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >>$log_file

cd /usr/share/nginx/html
echo unziping File
unzip /tmp/frontend.zip >>$log_file




echo restartNginx service
systemctl enable nginx >>$log_file
systemctl restart nginx >>$log_file