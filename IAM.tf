resource "aws_iam_role" "ec2-role" {
  name = "ec2_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

}


resource "aws_iam_policy" "s3_policy" {
  name        = "s3_policy"
  
  policy = jsonencode({
    Version = "2012-10-17",
    
	"Statement": [
		{
			"Effect": "Allow",
			"Action": [
				"s3:PutObject",
				"s3:ListBucket",
				"s3:GetObject"
			],
			"Resource": ["arn:aws:s3:::shebl-test-2216",
            "arn:aws:s3:::shebl-test-2216/*"
            ]
		}
	]

  })
}

resource "aws_iam_role_policy_attachment" "role-attach" {
  role       = aws_iam_role.ec2-role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.ec2-role.name
}