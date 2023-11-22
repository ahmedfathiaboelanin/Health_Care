import { useState } from 'react'
// import reactLogo from './assets/react.svg'
// import viteLogo from '/vite.svg'
import Home from './Pages/Home/Home'
import Select from './Components/SelectDropDownMenu/Select'

import { BrowserRouter,Route,Routes } from 'react-router-dom'
import Diagnosis from './Pages/Services/Diagnosis/Diagnosis'
function App() {
  
  return (
    <>    
      <BrowserRouter>
        <Routes>
          <Route path='/' element={<Home/>}/>
          <Route path='/services'>
            <Route index element={<h1>All Services</h1>}/>
            <Route path='diagnosis' element={<Diagnosis/>}/>
          </Route>
        </Routes>
      </BrowserRouter>
    </>
  )
}

export default App
