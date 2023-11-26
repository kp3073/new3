source var.sh

echo install
dnf module disable mysql -y &>>$log_fil

cp mysql.repo /etc/yum.repos.d/mysql.repo

echo installing Mysql
dnf install mysql-community-server -y &>>$log_fil

echo restart service
systemctl enable mysqld &>>$log_fil
systemctl start mysqld &>>$log_fil


mysql_secure_installation --set-root-pass ExpenseApp@1

mysql -uroot -pExpenseApp@1

