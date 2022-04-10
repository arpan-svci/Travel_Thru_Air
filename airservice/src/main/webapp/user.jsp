<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

        html {
            overflow-x: hidden;
        }
    </style>
</head>
<body class="overflow-x-hidden">
	<%
		response.setHeader("cache-control","no-cache,no-store,must-revalidate");
		if(session.getAttribute("user_name")==null){
			response.sendRedirect("login.jsp");
		}
	%>
	
	<!-- For Background Image -->
    <div class="w-screen h-screen  opacity-75">
        <img src="./images/cover.jpg" alt="airplane" class="w-screen h-screen object-fill">
    </div>
	
	<!-- For Black Overlay over Background Image -->
    <div class="overlay z-10 bg-black opacity-50 absolute w-screen h-screen top-0 left-0"></div>
	
	<!-- Navbar -->
    <nav class="fixed top-0 left-0 w-screen h-24 z-[1000]">
        <!-- overlay -->
        <div class="absolute top-0 left-0 w-screen h-full opacity-50 bg-black z-10"></div>
        <!-- Navbar Contents -->
        <nav class="bg-transparent py-2 px-12 flex justify-between items-center h-full z-50 relative">
            <!-- Comapny Logo -->
            <div class="logo w-[7%] border-white p-1 border-2 bg-cyan-900 rounded-2xl">
                <img src="./images/logo2.png" alt="Logo" class="w-full border-cyan-400">
            </div>
            <!-- Buttons -->
            <div>
                <!-- Logout Button -->
                <form action="logout" method="post">
                    <button type="submit" class="uppercase bg-transparent px-8 py-1 border border-cyan-400 
                    text-cyan-400 hover:bg-cyan-800 hover:text-cyan-300 hover:border-cyan-300">
                        logout
                    </button>
                </form>
            </div>
        </nav>
    </nav>
    
    
    <div class="overflow-auto h-[82vh] top-40 w-screen absolute">

        <!-- Section Main -->
        <section class="flex flex-nowrap justify-between px-28 ">

            <!-- side Menu -->
            <section class="w-2/6 h-full flex flex-col gap-7 p-8">
                <!-- Buttons -->


                <!-- Special Offer -->
                <div class="relative group">
                    <div
                        class="overlay absolute top-0 left-0 bg-cyan-500 opacity-20 w-2/3 h-full z-10 group-hover:bg-black">
                    </div>
                    <button id="specialOfferBtn" class="text-cyan-400 text-lg px-4 py-2 uppercase relative z-20 h-full w-2/3 
                        border-cyan-400 border-r-4 group-hover:text-yellow-600"
                        onclick="changeFormHandler('specialOfferBtn')">
                        Special Offer
                    </button>
                </div>


                <!-- Admin Login -->
                <div class="relative group">
                    <div
                        class="overlay absolute top-0 left-0 bg-cyan-500 opacity-20 w-2/3 h-full z-10 group-hover:bg-black">
                    </div>
                    <button id="adminLoginBtn" class="text-cyan-400 text-lg px-4 py-2 uppercase relative z-20 h-full w-2/3 
                        border-cyan-400 border-r-4 group-hover:text-yellow-600"
                        onclick="changeFormHandler('adminLoginBtn')">
                        Admin Login
                    </button>
                </div>


                <!-- Search Airline -->
                <div class="relative group">
                    <div
                        class="overlay absolute top-0 left-0 bg-cyan-500 opacity-20 w-2/3 h-full z-10 group-hover:bg-black">
                    </div>
                    <button id="searchAirlineBtn" class="text-cyan-400 text-lg px-4 py-2 uppercase relative z-20 h-full w-2/3 
                        border-cyan-400 border-r-4 group-hover:text-yellow-600"
                        onclick="changeFormHandler('searchAirlineBtn')">
                        Search Airline
                    </button>
                </div>

            </section>



            <!-- Forms -->
            <section class="w-4/6 h-full">


                <!-- Special Offer -->
                <div id="specialDealForm" class="new-flight relative">
                    <!-- Overlay -->
                    <div class="overlay z-10 absolute top-0 left-0 h-full w-full bg-white opacity-10"></div>
                    <div class="relative z-20">
                        <!-- Heading -->
                        <h1 class="text-cyan-400 border-b-4 border-cyan-400 text-xl text-center py-4 ">
                            Enter Special Deal
                        </h1>


                        <div class="p-20 text-cyan-400 text-lg">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. At aut corporis illo reprehenderit
                            tempora distinctio dolorem ducimus ut est consectetur, reiciendis veniam alias fugit minus!
                            Itaque architecto, molestiae, dolore quas esse dolorem animi autem in neque consectetur
                            atque magni, cupiditate veritatis repudiandae pariatur quis dicta at. Repudiandae,
                            asperiores quia sunt maiores excepturi quas id impedit aut rerum. Excepturi cupiditate
                            corrupti quos enim unde suscipit vitae soluta voluptates velit. Quo architecto esse unde
                            natus. Eius labore saepe minus corporis maiores non exercitationem rem natus repellendus ut?
                            Eum asperiores perspiciatis officia ab. Dolores blanditiis laborum corrupti porro vel
                            reprehenderit, provident debitis vitae.
                        </div>

                    </div>
                </div>

                <!-- Admin Login -->
                <div id="adminLoginForm" class="hidden new-flight relative">
                    <!-- Overlay -->
                    <div class="overlay z-10 absolute top-0 left-0 h-full w-full bg-white opacity-10"></div>
                    <div class="relative z-20">
                        <!-- Heading -->
                        <h1 class="text-cyan-400 border-b-4 border-cyan-400 text-xl text-center py-4 ">
                            Admin Login
                        </h1>


                        <!-- Form -->
                        <form action="admin" method="post">
                            <div class="flex flex-col items-center justify-center gap-12 mt-40 pb-40">

                                <!-- User Name-->
                                <div class="container w-1/2">
                                    <input type="text" name="user_name" placeholder="Username"
                                        class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                                </div>
                                <!-- Password -->
                                <div class="container w-1/2">
                                    <input name="password" type="password" placeholder="Password"
                                        class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                                </div>

                                <div class="container w-1/2 flex justify-around">
                                    <button type="submit"
                                        class="uppercase px-6 py-1 text-xl bg-cyan-400 text-white hover:bg-cyan-500">
                                        Submit
                                    </button>
                                    <button type="reset" class="uppercase bg-transparent px-8 py-1 text-xl border border-cyan-400 
                                    text-cyan-400 hover:bg-cyan-800 hover:text-cyan-300 hover:border-cyan-300">
                                        reset
                                    </button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>


                <!-- Search Airline -->
                <div id="searchAirlineForm" class="hidden new-flight relative">
                    <!-- Overlay -->
                    <div class="overlay z-10 absolute top-0 left-0 h-full w-full bg-white opacity-10"></div>
                    <div class="relative z-20">
                        <!-- Heading -->
                        <h1 class="text-cyan-400 border-b-4 border-cyan-400 text-xl text-center py-4 ">
                            Search Airline
                        </h1>


                        <!-- Form -->
                        <form action="UserSearch" method="post">
                            <div class="flex flex-col items-center justify-center gap-12 mt-40 pb-40">

                                <!-- Name -->
                                <div class="container w-1/2">
                                    <input name="source" type="text" placeholder="Enter Source"
                                        class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                                </div>
                                <!-- Name -->
                                <div class="container w-1/2">
                                    <input type="datetime" name="destination" placeholder="Enter Destination"
                                        class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                                </div>
                                <!-- Name -->
                                <div class="container w-1/2">
                                    <input name="date" type="date" placeholder="Enter Date"
                                        class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                                </div>

                                <div class="container w-1/2 flex justify-around">
                                    <button type="submit"
                                        class="uppercase px-6 py-1 text-md text-xl bg-cyan-400 text-white hover:bg-cyan-500">
                                        Search
                                    </button>
                                    <button type="reset" class="uppercase text-xl bg-transparent px-8 py-1 border border-cyan-400 
                                    text-cyan-400 hover:bg-cyan-800 hover:text-cyan-300 hover:border-cyan-300">
                                        reset
                                    </button>
                                </div>
                            </div>
                        </form>

                    </div>
                </div>


            </section>
        </section>

        <!-- Special Offer Table -->
        <section id="specialOfferTable" class="my-16">

            <!-- Heading -->
            <div class="relative">
                <!-- Overlay -->
                <div class="absolute -top-1 left-[42%] w-[18rem] bg-white opacity-10 z-10 h-12 rounded-3xl"></div>
                <h1 class="border-1 text-center text-3xl my-10 text-cyan-400 z-20 relative">Special Offer</h1>
            </div>

            <!-- Table -->
            <table class="table-auto w-11/12 bg-black text-cyan-400 mx-auto">
                <thead>
                    <tr>
                        <th class="font-bold text-black text-lg py-2 border-2 border-cyan-900 bg-cyan-400">ID</th>
                        <th class="font-bold text-black text-lg py-2 border-2 border-cyan-900 bg-cyan-400">Departure
                            City</th>
                        <th class="font-bold text-black text-lg py-2 border-2 border-cyan-900 bg-cyan-400">Arrival City
                        </th>
                        <th class="font-bold text-black text-lg py-2 border-2 border-cyan-900 bg-cyan-400">Departure
                            Time</th>
                        <th class="font-bold text-black text-lg py-2 border-2 border-cyan-900 bg-cyan-400">Arrival Time
                        </th>
                        <th class="font-bold text-black text-lg py-2 border-2 border-cyan-900 bg-cyan-400">Stops</th>
                        <th class="font-bold text-black text-lg py-2 border-2 border-cyan-900 bg-cyan-400">fare</th>
                    </tr>
                </thead>
                <tbody>
                	
                	<c:forEach var="flight" items="${flight}">
						<tr>
							<td class="text-center border-2 border-cyan-400 p-1"><c:out value="${flight.id}" /></td>
							<td class="text-center border-2 border-cyan-400 p-1"><c:out value="${flight.source}" /></td>
							<td class="text-center border-2 border-cyan-400 p-1"><c:out value="${flight.destination}" /></td>
							<td class="text-center border-2 border-cyan-400 p-1"><c:out value="${flight.time_deperature}" /></td>
							<td class="text-center border-2 border-cyan-400 p-1"><c:out value="${flight.time_arrival}" /></td>
							<td class="text-center border-2 border-cyan-400 p-1"><c:out value="${flight.stops}" /></td>
							<td class="text-center border-2 border-cyan-400 p-1"><c:out value="${flight.fare}" /></td>
						</tr>
					</c:forEach>
                </tbody>
            </table>


        </section>

        <!-- Search Airline Table -->
        <section id="searchTable" class="hidden my-16">

            <!-- Heading -->
            <div class="relative">
                <!-- Overlay -->
                <div class="absolute -top-1 left-[42%] w-[18rem] bg-white opacity-10 z-10 h-12 rounded-3xl"></div>
                <h1 class="border-1 text-center text-3xl my-10 text-cyan-400 z-20 relative">Search Results</h1>
            </div>

            <!-- Table -->
            <table class="table-auto w-11/12 bg-black text-cyan-400 mx-auto">
                <thead>
                    <tr>
                        <th class="font-bold text-black text-lg py-2 border-2 border-cyan-900 bg-cyan-400">ID</th>
                        <th class="font-bold text-black text-lg py-2 border-2 border-cyan-900 bg-cyan-400">Departure
                            City</th>
                        <th class="font-bold text-black text-lg py-2 border-2 border-cyan-900 bg-cyan-400">Arrival City
                        </th>
                        <th class="font-bold text-black text-lg py-2 border-2 border-cyan-900 bg-cyan-400">Departure
                            Time</th>
                        <th class="font-bold text-black text-lg py-2 border-2 border-cyan-900 bg-cyan-400">Arrival Time
                        </th>
                        <th class="font-bold text-black text-lg py-2 border-2 border-cyan-900 bg-cyan-400">Stops</th>
                        <th class="font-bold text-black text-lg py-2 border-2 border-cyan-900 bg-cyan-400">fare</th>
                    </tr>
                </thead>
                <tbody>
					<c:forEach var="flight" items="${flight_user}">
						<tr>
							<td class="text-center border-2 border-cyan-400 p-1"><c:out value="${flight.id}" /></td>
							<td class="text-center border-2 border-cyan-400 p-1"><c:out value="${flight.source}" /></td>
							<td class="text-center border-2 border-cyan-400 p-1"><c:out value="${flight.destination}" /></td>
							<td class="text-center border-2 border-cyan-400 p-1"><c:out value="${flight.time_deperature}" /></td>
							<td class="text-center border-2 border-cyan-400 p-1"><c:out value="${flight.time_arrival}" /></td>
							<td class="text-center border-2 border-cyan-400 p-1"><c:out value="${flight.stops}" /></td>
							<td class="text-center border-2 border-cyan-400 p-1"><c:out value="${flight.fare}" /></td>
						</tr>
					</c:forEach>
                </tbody>
            </table>


        </section>

    </div>
    
    
    
	<!-- <h1>welcome</h1>
	<h2>SPECIAL OFFER</h2>
	<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Departure City</th>
						<th>Arrival City</th>
						<th>Departure Time</th>
						<th>Arrival Time</th>
						<th>Stops</th>
						<th>fare</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="flight" items="${flight}">
						<tr>
							<td><c:out value="${flight.id}" /></td>
							<td><c:out value="${flight.source}" /></td>
							<td><c:out value="${flight.destination}" /></td>
							<td><c:out value="${flight.time_deperature}" /></td>
							<td><c:out value="${flight.time_arrival}" /></td>
							<td><c:out value="${flight.stops}" /></td>
							<td><c:out value="${flight.fare}" /></td>
						</tr>
					</c:forEach>
	
				</tbody>
	</table>
	
	<h1>Search airline</h1>
	<form action="UserSearch" method="post">
		<h2>Enter source:</h2>
		<input name="source" type="text"><br>
		<h2>Enter destination:</h2>
		<input name="destination" type="text"><br>
		<h2>Enter date</h2>
		<input name="date" type="date"><br>
		<button type="submit">search</button>
		<button type="reset">reset</button>
	</form>
	<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Departure City</th>
						<th>Arrival City</th>
						<th>Departure Time</th>
						<th>Arrival Time</th>
						<th>Stops</th>
						<th>fare</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="flight" items="${flight_user}">
						<tr>
							<td><c:out value="${flight.id}" /></td>
							<td><c:out value="${flight.source}" /></td>
							<td><c:out value="${flight.destination}" /></td>
							<td><c:out value="${flight.time_deperature}" /></td>
							<td><c:out value="${flight.time_arrival}" /></td>
							<td><c:out value="${flight.stops}" /></td>
							<td><c:out value="${flight.fare}" /></td>
						</tr>
					</c:forEach>
	
				</tbody>
	</table>
	<form action="logout" method="post">
		<button type="submit">logout</button>
	</form>
	<h1>Enter username and password for admin login</h1>
	<form action="admin" method="post">
		<h2>USERNAME:</h2>
		<input name="user_name" type="text"><br>
		<h2>PASSWORD:</h2>
		<input name="password" type="password"><br>
		<button>submit</button>
	</form> -->
</body>
<script src="./js/logic2.js"></script>
</html>