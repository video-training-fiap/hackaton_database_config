provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "hackaton_prod" {
  identifier             = "hackatonprod"
  engine                 = "mysql"
  engine_version         = "8.0.23"
  instance_class         = "db.t2.micro"
  db_name                = "hackaton"
  username               = "admin"
  password               = var.db_password
  allocated_storage      = 20
  storage_type           = "gp2"
  skip_final_snapshot    = true
  publicly_accessible    = false
  backup_retention_period = 7
  tags = {
    Name = "My database"
  }
}

output "endpoint" {
  value = aws_db_instance.hackaton_prod.endpoint
}
