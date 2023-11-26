log_file=/tmp/expense.log


download (){
  echo Download $compo Code
    curl -s -o /tmp/$compo.zip https://expense-artifacts.s3.amazonaws.com/$compo.zip >>$log_file


    echo Extracting $compo Code
    unzip /tmp/$compo.zip >>$log_file
}