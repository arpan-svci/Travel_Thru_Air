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

        html{
            overflow-x: hidden;
        }
    </style>
</head>
<body class="overflow-x-hidden">
	<%
		response.setHeader("cache-control","no-cache,no-store,must-revalidate");
		if(session.getAttribute("admin")==null){
			if(session.getAttribute("user_name")==null){
				response.sendRedirect("login.jsp");
			}
			else{
				response.sendRedirect("user.jsp");
			}
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
                <form action="adminlogout" method="post">
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

                <!-- New Flight -->
                <div class="relative group">
                    <div
                        class="overlay absolute top-0 left-0 bg-cyan-500 opacity-20 w-2/3 h-full z-10 group-hover:bg-black">
                    </div>
                    <button id="newFlightBtn" class="text-cyan-400 text-lg px-4 py-2 uppercase relative z-20 h-full w-2/3 
                        border-cyan-400 border-r-4 group-hover:text-yellow-600"
                        onclick="changeFormHandler('newFlightBtn')">
                        New Flight
                    </button>
                </div>

                <!-- Special Deal -->
                <div class="relative group">
                    <div
                        class="overlay absolute top-0 left-0 bg-cyan-500 opacity-20 w-2/3 h-full z-10 group-hover:bg-black">
                    </div>
                    <button id="specialDealBtn" class="text-cyan-400 text-lg px-4 py-2 uppercase relative z-20 h-full w-2/3 
                        border-cyan-400 border-r-4 group-hover:text-yellow-600"
                        onclick="changeFormHandler('specialDealBtn')">
                        Special Deal
                    </button>
                </div>

                <!-- New Service -->
                <div class="relative group">
                    <div
                        class="overlay absolute top-0 left-0 bg-cyan-500 opacity-20 w-2/3 h-full z-10 group-hover:bg-black">
                    </div>
                    <button id="newServiceBtn" class="text-cyan-400 text-lg px-4 py-2 uppercase relative z-20 h-full w-2/3 
                        border-cyan-400 border-r-4 group-hover:text-yellow-600"
                        onclick="changeFormHandler('newServiceBtn')">
                        New Service
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


                <!-- New Flight -->
                <div id="newFlightForm" class="new-flight relative">
                    <!-- Overlay -->
                    <div class="overlay z-10 absolute top-0 left-0 h-full w-full bg-white opacity-10"></div>
                    <div class="relative z-20">
                        <!-- Heading -->
                        <h1 class="text-cyan-400 border-b-4 border-cyan-400 text-xl text-center py-4 ">
                            Enter New Flight
                        </h1>


                        <!-- Form -->
                        <form action="insert" method="post">
                            <div class="flex flex-col items-center justify-center gap-12 mt-40 pb-40">

                                <!-- Name -->
                                <div class="container w-1/2">
                                    <input type="text" name="id" placeholder="Enter name"
                                        class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                                </div>
                                <!-- Name -->
                                <div class="container w-1/2">
                                    <input type="text" name="company" placeholder="Enter Company"
                                        class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                                </div>
                                <!-- Name -->
                                <div class="container w-1/2">
                                    <input type="text" name="capacity" placeholder="Enter Capacity"
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

                <!-- Special Deal -->
                <div id="specialDealForm" class="hidden new-flight relative">
                    <!-- Overlay -->
                    <div class="overlay z-10 absolute top-0 left-0 h-full w-full bg-white opacity-10"></div>
                    <div class="relative z-20">
                        <!-- Heading -->
                        <h1 class="text-cyan-400 border-b-4 border-cyan-400 text-xl text-center py-4 ">
                            Enter Special Deal
                        </h1>


                        <!-- Form -->
                        <form action="special" method="post">
                            <div class="flex flex-col items-center justify-center gap-12 mt-40 pb-40">

                                <!-- Name -->
                                <div class="container w-1/2">
                                    <input type="text" name="id" placeholder="Enter ID"
                                        class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                                </div>
                                <!-- Name -->
                                <div class="container w-1/2">
                                    <input type="datetime" name="dealtime" placeholder="Enter Date and Time"
                                        class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                                </div>
                                <!-- Name -->
                                <div class="container w-1/2">
                                    <input type="text" name="discount" placeholder="Enter Discount"
                                        class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                                </div>

                                <div class="container w-1/2 flex justify-around">
                                    <button type="submit"
                                        class="uppercase px-6 py-1 text-md text-xl bg-cyan-400 text-white hover:bg-cyan-500">
                                        Submit
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


                <!--  New Service -->
                <div id="newServiceForm" class="hidden new-flight relative">
                    <!-- Overlay -->
                    <div class="overlay z-10 absolute top-0 left-0 h-full w-full bg-white opacity-10"></div>
                    <div class="relative z-20">
                        <!-- Heading -->
                        <h1 class="text-cyan-400 border-b-4 border-cyan-400 text-xl text-center py-4 ">
                            Enter New Service
                        </h1>


                        <!-- Form -->
                        <form action="insertservice" method="post">
                            <div class="flex flex-col items-center justify-center gap-8 mt-20 pb-20">

                                <!-- Name -->
                                <div class="container w-1/2">
                                    <input type="text" name="id" placeholder="Enter ID"
                                        class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                                </div>
                                <!-- Name -->
                                <div class="container w-1/2">
                                    <input type="text" name="boarding" placeholder="Enter Boarding"
                                        class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                                </div>
                                <!-- Name -->
                                <div class="container w-1/2">
                                    <input type="text" name="destination" placeholder="Enter Destination"
                                        class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                                </div>
                                <!-- Name -->
                                <div class="container w-1/2">
                                    <input type="datetime" name="departure" placeholder="Enter Departure Date and Time"
                                        class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                                </div>
                                <!-- Name -->
                                <div class="container w-1/2">
                                    <input type="datetime" name="arrival" placeholder="Enter Arrival Date and Time"
                                        class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                                </div>
                                <!-- Name -->
                                <div class="container w-1/2">
                                    <input type="datetime" name="fare" placeholder="Enter Fare"
                                        class="px-4 py-1 bg-transparent w-full border-2 border-cyan-400 text-cyan-400 rounded outline-none ">
                                </div>

                                <div class="container w-1/2 flex justify-around">
                                    <button type="submit"
                                        class="uppercase px-6 py-1 text-xl bg-cyan-400 text-white hover:bg-cyan-500">
                                        Add
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


                <!-- view -->
                <div id="searchAirlineForm" class="hidden new-flight relative">
                    <!-- Overlay -->
                    <div class="overlay z-10 absolute top-0 left-0 h-full w-full bg-white opacity-10"></div>
                    <div class="relative z-20">
                        <!-- Heading -->
                        <h1 class="text-cyan-400 border-b-4 border-cyan-400 text-xl text-center py-4 ">
                            Search Airline
                        </h1>


                        <!-- Form -->
                        <form action="view" method="post">
                            <div class="flex flex-col items-center justify-center gap-12 mt-40 pb-40">

                                <!-- Name -->
                                <div class="container w-1/2">
                                    <input type="text" name="source" placeholder="Enter Source"
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

        <!-- Search Table -->
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
                            <th class="font-bold text-black text-lg py-2 border-2 border-cyan-900 bg-cyan-400">Departure City</th>
                            <th class="font-bold text-black text-lg py-2 border-2 border-cyan-900 bg-cyan-400">Arrival City</th>
                            <th class="font-bold text-black text-lg py-2 border-2 border-cyan-900 bg-cyan-400">Departure Time</th>
                            <th class="font-bold text-black text-lg py-2 border-2 border-cyan-900 bg-cyan-400">Arrival Time</th>
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

    </div>
    
    
	<!-- <h1>enter new flight</h1>
	<form action="insert" method="post">
		<h2>Enter flight id:</h2>
		<input name="id" type="text"><br>
		<h2>Enter company:</h2>
		<input name="company" type="text"><br>
		<h2>Enter capacity:</h2>
		<input name="capacity" type="number"><br>
		<button type="submit">Submit</button><br>
		<button type="reset">reset</button>
	</form>
	<form action="adminlogout" method="post">
		<button type="submit">logout</button>
	</form>
	<h1>Search airline</h1>
	<form action="view" method="post">
		<h2>Enter source:</h2>
		<input name="source" type="text"><br>
		<h2>Enter destination:</h2>
		<input name="destination" type="text"><br>
		<h2>Enter date</h2>
		<input name="date" type="date"><br>
		<button type="submit">search</button>
		<button type="reset">reset</button>
	</form>
	<h1>Enter special deal</h1>
	<form action="special" method="post">
		<h2>Enter id</h2>
		<input type="text" name="id"><br>
		<h2>Enter valid date and time for deal</h2>
		<input type="datetime" name="dealtime">
		<h2>Enter discount</h2>
		<input type="number" name="discount">
		<button type="submit">submit</button>
		<button type="reset">reset</button>
	</form>
	<form action="insertservice" method="post">
		<h1>Enter new service</h1>
		<h2>Enter id:</h2>
		<input type="text" name="id"><br>
		<h2>Enter boarding:</h2>
		<input type="text" name="boarding"><br>
		<h2>Enter destination:</h2>
		<input type="text" name="destination"><br>
		<h2>Enter departure date and time:</h2>
		<input type="datetime" name="departure"><br>
		<h2>Enter arrival date and time:</h2>
		<input type="datetime" name="arrival"><br>
		<h2>Enter fare:</h2>
		<input type="number" name="fare"><br>
		<button type="submit">add</button>
		<button type="reset">reset</button>
	</form>
	<h1>admin</h1>
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
			</table> -->
	
</body>
<script src="./js/logic.js"></script>
</html>