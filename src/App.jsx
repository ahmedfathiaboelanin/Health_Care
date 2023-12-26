import { useState } from 'react'
// import reactLogo from './assets/react.svg'
// import viteLogo from '/vite.svg'
import Home from './Pages/Home/Home'
import Select from './Components/SelectDropDownMenu/Select'

import { BrowserRouter,Route,Routes } from 'react-router-dom'
import Diagnosis from './Pages/Services/Diagnosis/Diagnosis'
import NavBar from './Components/NavBar/NavBar'
import Footer from './Components/Footer/Footer'
import Blogs from './Pages/Blogs/Blogs'
function App() {
  
  return (
    <>
      <BrowserRouter>
        <NavBar/>
        <Routes>
          <Route path='/' element={<Home/>}/>
          <Route path='/services'>
            <Route index element={<h1>All Services</h1>}/>
            <Route path='diagnosis' element={<Diagnosis/>}/>
          </Route>
          <Route path='/blogs'>
            <Route index element={<Blogs/>}/>
            {/* <Route path=':id' element={<Diagnosis/>}/> */}
          </Route>
        </Routes>
        <Footer/>
      </BrowserRouter>
    </>
  )
}

export default App
