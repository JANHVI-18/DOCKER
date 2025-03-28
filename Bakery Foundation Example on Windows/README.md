


### 🏠 **Bakery Foundation Example on Windows** 🍞

#### **Overview**
This guide will walk you through setting up and using **Packer** to create a machine image (AMI) on AWS. It includes installation, configuration, and deployment on a Windows system. Let’s bake some awesome images together! 🧑‍🍳🔥

---

#### **Prerequisites** 🔑
Before you start, make sure you have:

- A **Windows** machine with **administrator access**. 💻
- An **AWS account** with **IAM credentials** (your secret ingredient 🗝️).
- Basic knowledge of **AWS** and **PowerShell**. 💡

---

#### **Step 1: Install Required Tools** ⚙️

---

##### **1.1 Install Packer** 💻

**Step 1:** **Download Packer**  
- Open your browser and go to the [Packer Download Page](https://www.packer.io/downloads). 🌐
- Download the **latest Windows (64-bit)** ZIP file. 📥

**Step 2:** **Extract Packer**  
- Navigate to the downloaded ZIP file. 📂
- Right-click and select **Extract All...** 🗂️
- Move `packer.exe` to `C:\packer` (Create this folder if it doesn’t exist). 🏠

**Step 3:** **Add Packer to System PATH**  
- Open **Environment Variables** (Search for it in Windows). ⚙️
- Click **Environment Variables** → Under **System Variables**, find **Path** → Click **Edit**. 🖊️
- Click **New**, then add:  
  `C:\packer`  
- Click **OK** and close all windows. ✅

**Step 4:** **Verify Packer Installation**  
Open **PowerShell** and run:  
```powershell
packer --version
```
💡 **Expected Output:** The Packer version should be displayed. 🎉

---

##### **1.2 Install AWS CLI** ☁️

**Step 1:** **Download AWS CLI**  
- Visit the [AWS CLI Download Page](https://aws.amazon.com/cli/). 🌐
- Download and run the `AWSCLI.msi` installer. 📥

**Step 2:** **Install AWS CLI**  
Follow the installation steps:  
Next → Next → Finish. 🏁  
Verify installation:  
```powershell
aws --version
```
💡 **Expected Output:** It should display something like:  
`aws-cli/2.x.x Windows/10` 🖥️

---

##### **1.3 Configure AWS CLI (5 minutes)** 🛠️  
Run the following command in **PowerShell**:  
```powershell
aws configure
```
Enter the following when prompted:

- **AWS Access Key ID:** `<Your AWS Key>` 🗝️
- **AWS Secret Access Key:** `<Your AWS Secret>` 🔑
- **Default region name:** `us-east-1` (or your preferred region) 🌍
- **Default output format:** `json` (Press Enter) 🎉

✅ **AWS CLI is now configured**! 🚀

---

#### **Step 2: Create the Packer Template** 📜

---

##### **2.1 Create the Packer HCL File** 📝  
- Open **Notepad** or **VS Code**. ✍️
- Copy the following code into a new file:

```hcl
packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = ">= 1.0.0"
    }
  }
}

variable "aws_region" {
  default = "us-east-1"
}

source "amazon-ebs" "python39" {
  ami_name      = "bakery-foundation-python39-${formatdate("YYYYMMDD-HHmmss", timestamp())}"
  instance_type = "t2.micro"
  region        = var.aws_region
  source_ami    = "ami-0a25f237e97fa2b5e"
  ssh_username  = "ubuntu"
}

build {
  sources = ["source.amazon-ebs.python39"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y python3.9 python3.9-venv python3.9-dev"
    ]
  }
}
```

- Save the file as **bakery.pkr.hcl** in `C:\packer`. 🗂️  
🍰 **Now we’re ready to bake!**

---

##### **2.2 Find a Valid Ubuntu AMI** 🔍  
The **AMI ID** varies by AWS region. Let’s find the latest Ubuntu AMI!  
Run the following AWS CLI command:  
```powershell
aws ec2 describe-images --owners 099720109477 --filters "Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*" --query "Images | sort_by(@, &CreationDate)[-1].ImageId" --output text
```
✅ **Update `bakery.pkr.hcl`** by replacing the `source_ami` with the new AMI ID.

```hcl
source "amazon-ebs" "python39" {
  ami_name      = "bakery-foundation-python39-${formatdate("YYYYMMDD-HHmmss", timestamp())}"
  instance_type = "t2.micro"
  region        = var.aws_region
  source_ami    = "ami-xxxxxxxxxxxxxxx"  # Replace with actual AMI ID
  ssh_username  = "ubuntu"
}
```

---

#### **Step 3: Validate and Build the Image** 🔨

---

##### **3.1 Initialize and Validate Packer Template** 🚀  
- Open **PowerShell** and navigate to `C:\packer`:  
  ```powershell
  cd C:\packer
  ```
- Initialize Packer:  
  ```powershell
  packer init .
  ```

- Validate the template:  
  ```powershell
  packer validate bakery.pkr.hcl
  ```
✅ **Expected Output:** The configuration is valid! ✔️

---

##### **3.2 Build the Machine Image** 🏗️  
Run the following command to build the image:

```powershell
packer build bakery.pkr.hcl
```

This will:  
- Create a temporary EC2 instance 🖥️
- Install **Python 3.9** 🐍
- Convert the instance into an **Amazon Machine Image (AMI)** 💾
- Delete the temporary instance 🗑️

---

#### **Step 4: Deploy and Test the AMI** 🧪

---

##### **4.1 Find the AMI** 🔎  
- Log in to the **AWS Console**.  
- Navigate to **EC2 → AMIs** (Set the region you used when creating the AMI).  
- Find the AMI named: `bakery-foundation-python39-timestamp` 🕒

---

##### **4.2 Launch an EC2 Instance with Your AMI** 🚀  
1. Go to the **AWS EC2 Console**.  
2. Click **Launch Instance → My AMIs** (Left Sidebar).  
3. Search for your AMI and Select It.  
4. Choose:  
   - **Instance Type:** `t2.micro` (or higher, based on your needs). ⚙️  
   - **Key Pair:** Use an existing key or create a new one. 🔑  
   - **Security Group:** Allow **SSH (port 22)** and other required ports. 🔓  
5. Click **Launch!** 🚀

---

##### **4.3 Verify Python Installation** ✅  
Once inside the instance, run:  
```bash
python3.9 --version
```
💡 **Expected Output:**  
`Python 3.9.21` 🍰

---

#### **📸 Result Screenshots** 🖼️

1. **AMI Created Successfully** 💡  
After running the `packer build` command, you should see an output like this:

```
==> Builds finished. The artifacts of successful builds are:
--> amazon-ebs.python39: AMIs were created:
us-east-1: ami-xxxxxxxxxxxxxxxxx
```

---

2. **Running EC2 Instance with Python 3.9** 🎉  
Once the instance is running, SSH into it and run the command:

```bash
python3.9 --version
```

**Expected Result:**  
`Python 3.9.21` 🐍

---

### **Default Ubuntu Python Version** 🐍  
By default, **Ubuntu 20.04** comes with **Python 3.8**. That’s why running `python3 --version` returns:

```
Python 3.8.10
```

But with our magic, we installed **Python 3.9**! 🌟

---

#### **Conclusion** 🎉
You’ve **successfully** set up **Packer**, created an **AWS AMI**, and deployed an **EC2 instance with Python 3.9**! 🍰🚀

---

#### **Additional Tips** 💡
- **Optimize Your AMI**: Add more steps to customize your AMI further. 🛠️
- **Automate with CI/CD**: Integrate Packer into your CI/CD pipeline for continuous image builds. 🔄
- **Monitor Costs**: Keep an eye on AWS billing to avoid unexpected charges. 💸

---

#### **Troubleshooting** ⚠️
- **SSH Connection Issues**: Ensure your security group allows **SSH** access and your key pair is configured properly. 🔑
- **Packer Build Failures**: Check the **Packer logs** for detailed error messages and validate your template again. 🔍

---

### **Further Reading** 📚
- [Packer Documentation](https://www.packer.io/docs)
- [AWS EC2 User Guide](https://docs.aws.amazon.com/ec2/index.html)
- [Python Installation Guide](https://www.python.org/doc/)

---

Enjoy baking your machine images with Packer! 🍞✨
