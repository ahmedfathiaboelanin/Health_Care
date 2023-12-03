import Footer from '../../Components/Footer/Footer';
import Speciality from '../../Components/SpecialitySection/Speciality';
import Doctors from '../../Components/DoctorsSection/Doctors';
import HeroSection from '../../Components/HeroSection/HeroSection';

const Home = () => {
   return (
      <>
         <HeroSection/> 
         <Speciality/>
         <Doctors/>
         <Footer/>
      </>
   );
};

export default Home;