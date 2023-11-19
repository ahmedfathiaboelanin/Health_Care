import { BrowserRouter,Route,Routes } from 'react-router-dom'
import Diagnosis from './Pages/Services/Diagnosis/Diagnosis'
function App() {
  
  return (
    <>
      <BrowserRouter>
        <Routes>
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
