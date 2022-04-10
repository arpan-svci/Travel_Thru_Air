// Buttons
let newFlightBtn = document.getElementById('newFlightBtn');
let specialDealBtn = document.getElementById('specialDealBtn');
let newServiceBtn = document.getElementById('newServiceBtn');
let searchAirlineBtn = document.getElementById('searchAirlineBtn');

// Forms
let newFlightForm = document.getElementById('newFlightForm');
let specialDealForm = document.getElementById('specialDealForm');
let newServiceForm = document.getElementById('newServiceForm');
let searchAirlineForm = document.getElementById('searchAirlineForm');

// Search table
let searchTable = document.getElementById('searchTable');


const changeFormHandler = (val)=>{

    console.log(val)
    

    if(val === "newFlightBtn"){
        newFlightForm.classList.remove("hidden");
        specialDealForm.classList.add("hidden");
        newServiceForm.classList.add("hidden");
        searchAirlineForm.classList.add("hidden");
    }
    else if(val === "specialDealBtn"){
        newFlightForm.classList.add("hidden");
        specialDealForm.classList.remove("hidden");
        newServiceForm.classList.add("hidden");
        searchAirlineForm.classList.add("hidden");
    }
    else if(val === "newServiceBtn"){
        newFlightForm.classList.add("hidden");
        specialDealForm.classList.add("hidden");
        newServiceForm.classList.remove("hidden");
        searchAirlineForm.classList.add("hidden");
    }
    else if(val === "searchAirlineBtn"){
        newFlightForm.classList.add("hidden");
        specialDealForm.classList.add("hidden");
        newServiceForm.classList.add("hidden");
        searchAirlineForm.classList.remove("hidden");
    }

    if(!searchAirlineForm.classList.contains("hidden")){
        searchTable.classList.remove("hidden");
    }else{
        searchTable.classList.add("hidden");
    }

}




