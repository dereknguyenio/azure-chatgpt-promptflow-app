variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  default     = "uksouth"
}

variable "docker_image_name" {
  description = "The name of the Docker image."
  default     = "streamlitpromptflowdemo"
}

# Add other necessary variables
