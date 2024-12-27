<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link rel="stylesheet" href="style2.css">
</head>
<body>
<form action="action_page.php">
  <div class="container">
    <header class="header">
        <h1 class="title">Please fill up this form to register</h1>
        <img src="auto-car-logo-template-vector-icon.jpg" alt="Logo" class="header-image">
    </header>
    <hr>
    <label for="name"><b>Name</b></label>
    <input type="text" placeholder="Name" name="name" id="name" required>

    <label for="phone"><b>Enter your phone number:</b></label><br>
    <input type="tel" placeholder="Phone Number" id="phone" name="phone" pattern=" /(^(\+8801|8801|01))[1|3-9]{1}(\d){8}$/" required><br>

    <label for="address"><b>Address</b></label>
    <input type="text" placeholder="Address" name="address" id="address" required>

     <label for="nid"><b>Enter NID Number</b></label><br>
    <input type="ssn" placeholder="NID Number" name="nid" id="nid" required><br>

    <label for="email"><b>Email</b></label><br>
    <input type="email" placeholder="Enter Email" name="email" id="email" required>
    <br>

    <label for="date_of_birth"><b>Date of Birth</b></label><br>
    <input type="date"   placeholder="Enter date of birth" id="date_of_birth" name="date_of_birth" required> 
    <br>
    <label for="psw"><b>Password</b></label><br>
    <input type="password" placeholder="Enter Password" name="psw" id="psw" required><br>

    <label for="psw-repeat"><b>Repeat Password</b></label><br>
    <input type="password" placeholder="Repeat Password" name="psw-repeat" id="psw-repeat" required>
    <hr>


    <button type="submit" class="registerbtn" onclick="homepage.php">Register</button>
  </div>

  <div class="container signin">
    <p>Already have an account? <a href="index.php">Sign in</a>.</p>
  </div>
</form>

</body>
</html>