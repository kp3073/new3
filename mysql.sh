source var.sh

echo install
dnf module disable mysql -y &>>$log_file
expression

cp mysql.repo /etc/yum.repos.d/mysql.repo

echo installing Mysql
dnf install mysql-community-server -y &>>$log_file
expression

echo restart service
systemctl enable mysqld &>>$log_file
systemctl start mysqld &>>$log_file
expression

mysql_secure_installation --set-root-pass ExpenseApp@1 >>$log_file
expression

mysql -uroot -pExpenseApp@1 >>$log_file
expression
