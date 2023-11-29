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

expense_root_password=$1
mysql_secure_installation --set-root-pass $expense_root_password >>$log_file


