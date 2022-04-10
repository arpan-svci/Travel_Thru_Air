<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" href="./input.css">

    <style>
        input::placeholder {
            color: cyan;
        }
    </style>
</head>
<body>

	<body class="overflow-hidden">

    <!-- For Background Image -->
    <div class="w-screen h-screen  opacity-75">
        <img src="./images/cover.jpg" alt="airplane" class="w-screen h-fit">
    </div>

    <!-- For Black Overlay over Background Image -->
    <div class="overlay z-10 bg-black opacity-50 absolute w-screen h-screen top-0 left-0"></div>

    <!-- For Circular Effect  -->
    <div class="absolute w-1/3 h-5/6 opacity-10 bg-white border-l-cyan-400 top-24 left-1/3 z-20 rounded-3xl">
    </div>


    <!-- Main Content -->
    <div class="absolute w-1/3 h-5/6 top-16 left-1/3 z-30">
        <!-- Comapny Logo -->
        <div class="w-full my-10">
            <img src="./images/logo2.png" alt="" class="w-1/2  mx-auto">
        </div>

        <!-- Input Form -->
        <div>
            <form action="sign" method="post">

                <div class="flex flex-col items-center justify-center gap-8">
                    <!-- Name -->
                    <div class="container w-1/2">
                        <input type="text" name="name" placeholder="Name"
                            class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                    </div>

                    <!-- Email ID -->
                    <div class="container w-1/2">
                        <input type="email" name="email" placeholder="Email ID"
                            class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                    </div>

                    <!-- Phone Number -->
                    <div class="container w-1/2">
                        <input type="text" name="phone" placeholder="Phone Number"
                            class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                    </div>

                    <!-- Date Of Birth -->
                    <div class="container w-1/2">
                        <input type="date" name="date_of_birth"
                            class="px-4 py-1 bg-transparent border-2 w-full border-cyan-400 text-cyan-400 rounded outline-none ">
                    </div>

                    <!-- Age -->
                    <div class="container w-1/2">
                        <input type="text" name="age" placeholder="Age"
                            class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                    </div>

                    <!-- UserName -->
                    <div class="container w-1/2">
                        <input type="text" name="username" placeholder="User Name"
                            class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                    </div>

                    <!-- Password -->
                    <div class="container w-1/2">
                        <input type="password" name="password" placeholder="Password"
                            class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                    </div>

                    <!-- Submit -->
                    <div class="container w-1/2">
                        <button type="submit" class="uppercase px-7 py-3 text-xl bg-cyan-400 text-white w-full hover:bg-cyan-500 ">
                            Submit
                        </button>
                    </div>


                </div>
            </form>
        </div>


    </div>
</body>
	<!-- sign up
	<form action="sign" method="post">
		<h2>name:</h2>
		<input type="text" name="name">
		<h2>email id:</h2>
		<input type="email" name="email">
		<h2>phone number:</h2>
		<input type="number" name="phone">
		<h2>date of birth:</h2>
		<input type="date" name="date_of_birth">
		<h2>age:</h2>
		<input type="number" name="age">
		<h2>user name:</h2>
		<input type="text" name="username">
		<h2>password:</h2>
		<input type="password" name="password"><br><br>
		<button type="submit"><h1>submit</h1></button>
	</form>-->
</body>
</html>