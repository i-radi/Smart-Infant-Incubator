//for getting incubators number
async function getinc()
{

     let url='http://localhost:5000/api/Incubators';

     try
     {
      let res = await fetch(url);
      return await res.json();
     }
     catch (error)
     {
        console.log(error);
     }

}

//for getting babies number
async function getbabies()
{

     let url='http://localhost:5000/api/Babies';

     try
     {
      let res = await fetch(url);
      return await res.json();
     }
     catch (error)
     {
        console.log(error);
     }

}

//for getting operator number
async function getoperator()
{

     let url='http://localhost:5000/api/Users?type=2';

     try
     {
      let res = await fetch(url);
      return await res.json();
     }
     catch (error)
     {
        console.log(error);
     }

}

//for getting doctor number
async function getdoctor()
{

     let url='http://localhost:5000/api/Users?type=3';

     try
     {
      let res = await fetch(url);
      return await res.json();
     }
     catch (error)
     {
        console.log(error);
     }

}

//for getting nurse number
async function getnurse()
{

     let url='http://localhost:5000/api/Users?type=4';

     try
     {
      let res = await fetch(url);
      return await res.json();
     }
     catch (error)
     {
        console.log(error);
     }

}



async function render()
{

let inc = await getinc();
let baby = await getbabies();
let operator = await getoperator();
let doctor = await getdoctor();
let nurse = await getnurse();

let inc_counter=0;
let baby_counter=0;
let operator_counter=0;
let doctor_counter=0;
let nurse_counter=0;

inc.forEach(element => {inc_counter++;});
baby.forEach(element => {baby_counter++;});
operator.forEach(element => {operator_counter++;});
doctor.forEach(element => {doctor_counter++;});
nurse.forEach(element => {nurse_counter++;});

document.getElementById('incubators-num').innerHTML=inc_counter;
document.getElementById('babies-num').innerHTML=baby_counter;
document.getElementById('operators-num').innerHTML=operator_counter;
document.getElementById('doctors-num').innerHTML=doctor_counter;
document.getElementById('nurses-num').innerHTML=nurse_counter;
}

render();