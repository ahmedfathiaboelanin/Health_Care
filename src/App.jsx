import { useState } from 'react'
// import reactLogo from './assets/react.svg'
// import viteLogo from '/vite.svg'
import Home from './Pages/Home/Home'

import { BrowserRouter, Route, Routes } from 'react-router-dom'
import Diagnosis from './Pages/Services/Diagnosis/Diagnosis'
import NavBar from './Components/NavBar/NavBar'
import Footer from './Components/Footer/Footer'
import Blogs from './Pages/Blogs/Blogs'
import Login from './Pages/Login/Login'
import { createContext } from 'react'
import Register from './Pages/Register/Register'

export const loginContext = createContext();
function App() {
  const [login, setLogin] = useState(false)
  return (
    <>
      <loginContext.Provider value={{login,setLogin}}>
        <BrowserRouter>
          <NavBar />
          <Routes>
            <Route path='/' element={<Home />} />
            <Route path='/services'>
              <Route index element={<h1>All Services</h1>} />
              <Route path='diagnosis' element={<Diagnosis />} />
            </Route>
            <Route path='/blogs'>
              <Route index element={<Blogs />} />
              {/* <Route path=':id' element={<Diagnosis/>}/> */}
            </Route>

            <Route path='/account'>
              <Route index element={<h1>Account</h1>} />
              <Route path='login' element={<Login />} />
              <Route path='register' element={<Register />} />
            </Route>

          </Routes>
          <Footer />
        </BrowserRouter>
      </loginContext.Provider>
    </>
  )
}

export default App
