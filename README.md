# Automated DevSecOps & IaC Security Pipeline

![Security Pipeline Status](https://github.com/druthishetty07/devsecops-pipeline-lab/actions/workflows/security-scan.yml/badge.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)
![Terraform](https://img.shields.io/badge/Terraform-1.5+-purple.svg)
![GitHub Actions](https://img.shields.io/badge/GitHub_Actions-CI%2FCD-blue.svg)

An automated Continuous Integration / Continuous Deployment (CI/CD) security pipeline built using **GitHub Actions**, **Checkov**, **Trivy**, and **Terraform**. This project demonstrates "Shift-Left" security principles by automatically inspecting Infrastructure as Code (IaC) blueprints and container build images for vulnerabilities prior to deployment.

---

## 🏗️ Architecture Overview

```text
  +-----------------------+
  |  Developer Git Push   |
  +-----------+-----------+
              |
              v
  +-----------------------+
  |    GitHub Actions     |
  +-----------+-----------+
              |
      +-------+-------+
      |               |
      v               v
  +-------+       +-------+
  | Checkov|       | Trivy |
  | (IaC) |       | (CVE) |
  +---+---+       +---+---+
      |               |
      +-------+-------+
              |
              v
  +-----------------------+
  | Automated Gate Check  |
  |  (PASS -> Deploy)     |
  |  (FAIL -> Block)      |
  +-----------------------+
