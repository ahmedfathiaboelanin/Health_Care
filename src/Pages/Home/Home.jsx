import React from 'react';
import Footer from '../../Components/Footer/Footer';
import Speciality from '../../Components/SpecialitySection/Speciality';
import Doctors from '../../Components/DoctorsSection/Doctors';

const Home = () => {
   return (
      <>
         <Speciality/>
         <Doctors/>
         <Footer/>
      </>
   );
};

export default Home;