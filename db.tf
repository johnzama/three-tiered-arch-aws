resource "aws_rds_cluster" "aurora" {
  cluster_identifier      = "aurora-cluster"
  engine                  = "aurora-mysql"
  engine_mode             = "provisioned"
  master_username         = "admin"
  master_password         = "YourPassword123" # Replace with a secure password
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  vpc_security_group_ids  = [aws_security_group.db_sg.id]

  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name

  tags = {
    Name = "Aurora-Cluster"
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "aurora-subnet-group"
  subnet_ids = [aws_subnet.private_subnet_db_1.id, aws_subnet.private_subnet_db_2.id]

  tags = {
    Name = "Aurora-DB-Subnet-Group"
  }
}

resource "aws_rds_cluster_instance" "aurora_instance_1" {
  identifier              = "aurora-instance-1"
  cluster_identifier      = aws_rds_cluster.aurora.id
  instance_class          = "db.t3.medium"
  engine                  = aws_rds_cluster.aurora.engine
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name

  tags = {
    Name = "Aurora-Instance-1"
  }
}

resource "aws_rds_cluster_instance" "aurora_instance_2" {
  identifier              = "aurora-instance-2"
  cluster_identifier      = aws_rds_cluster.aurora.id
  instance_class          = "db.t3.medium"
  engine                  = aws_rds_cluster.aurora.engine
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name

  tags = {
    Name = "Aurora-Instance-2"
  }
}
