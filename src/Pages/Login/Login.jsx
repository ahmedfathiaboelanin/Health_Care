/* eslint-disable no-unused-vars */
import styles from "./Login.module.css"
import LoginPic from "../../assets/login.png"
import { Link, useNavigate } from "react-router-dom"
import { useContext, useEffect, useState } from "react"
import axios from "axios"
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { loginContext } from "../../App"
import { useCookies } from "react-cookie"


export default function Login() {
    const [userName,setUserName] = useState("")
    const [password, setPassword] = useState("")
    const { login, setLogin } = useContext(loginContext)
    const errorAlert = (e) => toast.error(e); // if the any input is empty

    const navigate = useNavigate()

    const[token,setCookies] = useCookies(['access_token'])

    // Check to the localstorage
    useEffect(() => {
        if (token.access_token) {
            setLogin(true)
            navigate("/")
        }
    })
    
    const handelLogin = async (event) => {
        event.preventDefault();

        if (userName.length === 0 || password.length ===0) {
            errorAlert("Username And Password are required")
        } else {
            try {
                // call the api
                let response = await axios.post("http://127.0.0.1:8000/api/auth/login",
                    { user_name: userName, password },
                    {
                        headers: {
                            'Content-Type': 'application/json',
                        },
                    }
                )
                if (response.data.access_token) {
                    // set the response in the local storage
                    setCookies("access_token",response.data.access_token)
                    localStorage.setItem("user", JSON.stringify(response.data.user))
                    setLogin(true)
                } else {
                    errorAlert("ERROR") // set error alert if the api call faild
                }
            } catch (err) {
                errorAlert("Wrong Username or password") // set error alert if the api call faild
            }
        }
    }
    return (
        <main className={`${styles.page}`}>
            <section className={`${styles.loginSec} container`}>
                <div className={`row align-items-center justify-content-center gap-5`}>
                    {/* login form */}
                    <form className={`col-md-6 col-lg-4 col-sm-8 col-10 ${styles.loginForm}`}>
                        <h1>Welcome Back</h1>
                        <input type="text" onChange={e=>setUserName(e.target.value)}  placeholder="Enter Your UserName" className={styles.input} />
                        <input type="password" onChange={e=>setPassword(e.target.value)} placeholder="password" className={styles.input} />
                        <button onClick={handelLogin}>Login</button>
                        <p>Don{"'"}t have Account ?<Link to="/account/register"> Get one</Link></p>
                    </form>
                    <div className={`img d-none d-md-block col-md-4`}>
                        <img src={LoginPic} alt="" className={`img-fluid`} />
                    </div>
                </div>
            </section>
            {/* Alert */}
            <ToastContainer
                position="top-center"
                autoClose={5000}
                hideProgressBar={false}
                newestOnTop={false}
                closeOnClick
                rtl={false}
                pauseOnFocusLoss
                draggable
                pauseOnHover
                theme="light"
            />
            <svg
                width="500"
                height="500"
                viewBox="0 0 1000 1000"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
                className={`${styles.svgCircle} d-none d-md-block`}
            >
                <circle opacity="0.5" cx="500" cy="500" r="500" fill="#B3E5FC" />
            </svg>
            <svg
                width="500"
                height="500"
                viewBox="0 0 1000 1000"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
                className={`${styles.svgCircle1} d-none d-md-block`}
            >
                <circle opacity="0.5" cx="500" cy="500" r="500" fill="#B3E5FC" />
            </svg>
        </main>
    )
}
