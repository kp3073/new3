echo install
dnf module disable mysql -y >>/tmp/expense.log

cp mysql.repo /etc/yum.repos.d/mysql.repo

echo installing Mysql
dnf install mysql-community-server -y >>/tmp/expense.log

echo restart service
systemctl enable mysqld >>/tmp/expense.log
systemctl start mysqld >>/tmp/expense.log


mysql_secure_installation --set-root-pass ExpenseApp@1

mysql -uroot -pExpenseApp@1

