locals {
  users = {
    "gella" = "arn:aws:iam::aws:policy/AlexaForBusinessReadOnlyAccess",
    "cella" = "arn:aws:iam::aws:policy/AlexaForBusinessReadOnlyAccess",
    "della" = "arn:aws:iam::aws:policy/AdministratorAccess",
    "hella" = "arn:aws:iam::aws:policy/AlexaForBusinessReadOnlyAccess"
  }
}

locals {
    managed_polices = {
        security = "arn:aws:iam::aws:policy/AdministratorAccess"
        devops ="arn:aws:iam::aws:policy/AlexaForBusinessReadOnlyAccess"
        compliance ="arn:aws:iam::aws:policy/AlexaForBusinessReadOnlyAccess"
}

inline_polices ={
    security = jsonencode({
        Version = "2012-10-17",
        Statement =[
            {
                Effect = "Allow"
                Action = "ec2:*"
                Resource= "*"
             }
        ] 
    })

    devops = jsonencode ({
        Version = "2012-10-17"
        Statement = [
            {
                Effect = "Allow"
                Action = "s3"
                Resource = "*"
                }
             ]
        })
        
        compliance = jsonencode ({
            Version = "2012-10-17"
            Statement = [
                {
                    Effect = "Allow"
                    Action = "cloudtrail:*"  
                    Resource ="*"
                }
            ]
        })
    }
}
    