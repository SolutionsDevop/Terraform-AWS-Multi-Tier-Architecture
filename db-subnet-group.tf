# The database tier stores and manages the application data. Amazon
# rds is used to for management of the data. These includes the managed mysql
# service for database server and SG to control what comes in and out of the db
# Config file to create a subnet group for RDS 

resource "aws_db_subnet_group" "subnet-grp" {
  name       = var.db-subnet-grp-name
  subnet_ids = [aws_subnet.db-subnet1.id, aws_subnet.db-subnet2.id]

  tags = {
    Name = var.db-subnet-grp-name
  }
}

