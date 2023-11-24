echo installing nginx
dnf install nginx -y >>/tmp/expense.log

cp expense.conf /etc/nginx/default.d/expense.conf



echo removing old contant
rm -rf /usr/share/nginx/html/* >>/tmp/expense.log

echo downloding frontend contant
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >>/tmp/expense.log

cd /usr/share/nginx/html
echo unziping File
unzip /tmp/frontend.zip >>/tmp/expense.log




echo restartNginx service
systemctl enable nginx >>/tmp/expense.log
systemctl restart nginx >>/tmp/expense.log