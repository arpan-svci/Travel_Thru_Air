// Buttons
let adminLoginBtn = document.getElementById('adminLoginBtn');
let specialOfferBtn = document.getElementById('specialOfferBtn');
let searchAirlineBtn = document.getElementById('searchAirlineBtn');


// Forms
let adminLoginForm = document.getElementById('adminLoginForm');
let specialDealForm = document.getElementById('specialDealForm');
let searchAirlineForm = document.getElementById('searchAirlineForm');


// Search table
let specialOfferTable = document.getElementById('specialOfferTable');
let searchTable = document.getElementById('searchTable');


const changeFormHandler = (val)=>{

    console.log(val)
    

    if(val === "adminLoginBtn"){
        adminLoginForm.classList.remove("hidden");
        specialDealForm.classList.add("hidden");
        searchAirlineForm.classList.add("hidden");
    }
    else if(val === "specialOfferBtn"){
        adminLoginForm.classList.add("hidden");
        specialDealForm.classList.remove("hidden");
        searchAirlineForm.classList.add("hidden");
    }
    else if(val === "searchAirlineBtn"){
        adminLoginForm.classList.add("hidden");
        specialDealForm.classList.add("hidden");
        searchAirlineForm.classList.remove("hidden");
    }

    if(!searchAirlineForm.classList.contains("hidden")){
        searchTable.classList.remove("hidden");
    }else{
        searchTable.classList.add("hidden");
    }

    if(!specialDealForm.classList.contains("hidden")){
        specialOfferTable.classList.remove("hidden");
    }else{
        specialOfferTable.classList.add("hidden");
    }

}