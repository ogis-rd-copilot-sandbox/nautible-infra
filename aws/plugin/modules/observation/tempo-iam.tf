resource "aws_iam_policy" "tempo_bucket_policy" {
  name = "${var.pjname}-${var.region}-tempo-bucket-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "s3:GetObject",
          "s3:DeleteObject",
          "s3:PutObject",
          "s3:GetObjectTagging",
          "s3:PutObjectTagging",
        ]
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.tempo_bucket.bucket}/*"
        ]
      },
      {
        Effect = "Allow",
        Action = [
          "s3:ListBucket",
        ]
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.tempo_bucket.bucket}"
        ]
      }
    ]
  })
}

resource "aws_iam_role" "tempo_bucket_role" {
  name = "${var.pjname}-tempo-bucket-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = "sts:AssumeRoleWithWebIdentity",
        Principal = {
          Federated = var.eks_oidc_provider_arns
        }
        Condition = {
          StringEquals = {
            "${var.oidc}:sub" = "system:serviceaccount:monitoring:tempo-sa",
            "${var.oidc}:aud" = "sts.amazonaws.com"

          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "tempo_bucket_policy_attachment" {
  role       = aws_iam_role.tempo_bucket_role.name
  policy_arn = aws_iam_policy.tempo_bucket_policy.arn
}
