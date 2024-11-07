# Create a Timestream Database
resource "aws_timestreamwrite_database" "iot_farm_db" {
  database_name = var.timestream_database_name
}

# Create a Timestream Table
resource "aws_timestreamwrite_table" "sensor_data_table" {
  database_name = aws_timestreamwrite_database.iot_farm_db.database_name
  table_name    = var.timestream_table_name

  retention_properties {
    # Memory Store retention (in hours)
    memory_store_retention_period_in_hours = var.memory_store_retention_hours

    # Magnetic Store retention (in days)
    magnetic_store_retention_period_in_days = var.magnetic_store_retention_days
  }
}
