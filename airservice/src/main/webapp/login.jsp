<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
    <link rel="stylesheet" href="./input.css">
    <style>
        input::placeholder {
            color: cyan;
        }
    </style>
<body>
	<body class="overflow-hidden">

    <!-- For Background Image -->
    <div class="w-screen h-screen  opacity-75">
        <img src="./images/cover.jpg" alt="airplane" class="w-screen h-fit">
    </div>

    <!-- For Black Overlay over Background Image -->
    <div class="overlay z-10 bg-black opacity-50 absolute w-screen h-screen top-0 left-0"></div>

    <!-- For Circular Effect  -->
    <div class="absolute w-1/3 h-3/5 opacity-10 bg-white border-l-cyan-400 top-40 left-1/3 z-20 rounded-3xl">
    </div>


    <!-- Main Content -->
    <div class="absolute w-1/3 h-3/5 top-40 left-1/3 z-30">
        <!-- Comapny Logo -->
        <div class="w-full my-19">
            <img src="./images/logo2.png" alt="" class="w-1/2  mx-auto">
        </div>

        <!-- Input Form -->
        <div>
            <form action="log" method="post">

                <div class="flex flex-col items-center justify-center gap-8">
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
    <!-- login
	<form action="log" method="post">
		<h2>user name:</h2>
		<input type="text" name="username">
		<h2>password:</h2>
		<input type="password" name="password"><br><br>
		<button type="submit"><h1>submit</h1></button>
	</form> -->
</body>
</html>