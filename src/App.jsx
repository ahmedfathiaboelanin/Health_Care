import { BrowserRouter,Route,Routes } from 'react-router-dom'
import Recommendation from './Pages/Recommendation/Recommendation'
function App() {
  
  return (
    <>
      <BrowserRouter>
        <Routes>
          <Route path="/recommendation" element={<Recommendation />} />
        </Routes>
      </BrowserRouter>
    </>
  )
}

export default App
