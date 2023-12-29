/* eslint-disable no-unused-vars */
import styles from "./Register.module.css"
import { Link, useNavigate } from "react-router-dom"
import { useContext, useEffect, useState } from "react"
import axios from "axios"
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { loginContext } from "../../App"


export default function Register() {
    const { login, setLogin } = useContext(loginContext)
    const errorAlert = (e) => toast.error(e); // if the any input is empty
    const navigate = useNavigate()
    const [firstName, setFirstName] = useState("")
    const [lastName, setLastName] = useState("")
    const [gender, setGender] = useState("male")
    const [email, setEmail] = useState("")
    const [userName, setUserName] = useState("")
    const [password, setPassword] = useState("")
    const [confirmPassword, setConfirmPassword] = useState("")
    const [isDoctor, setIsDoctor] = useState(false)
    const [specialist, setSpecialist] = useState("")
    const [doctorId, setDoctorId] = useState(null)

    // Check the localstorage
    useEffect(() => {
        if (localStorage.getItem("token")) {
            setLogin(true)
            navigate("/")
        }
    })

    const handelRegister = (event) => {
        event.preventDefault()
        if (firstName.length === 0 || lastName.length === 0 || email.length === 0 || userName.length === 0 || password.length === 0 || confirmPassword.length === 0) {
            errorAlert("All fields are required")
        } else if (password !== confirmPassword) {
            errorAlert("Password and Confirm Password does not match")
        } else {
            if (isDoctor) {
                if (specialist.length === 0 || doctorId.length === 0) {
                    errorAlert("Doctor Data are required")
                }
                axios.post("http://127.0.0.1:8000/api/auth/register", {
                    first_name: firstName,
                    last_name: lastName,
                    gender: gender,
                    email: email,
                    user_name: userName,
                    password: password,
                    user_type: 'doctor',
                    doctor_personal_id: doctorId,
                    specialization: specialist
                }).then(res => {
                    navigate("/account/login")
                }).catch(err => {
                    errorAlert(err)
                })
            } else {
                axios.post("http://127.0.0.1:8000/api/auth/register", {
                    first_name: firstName,
                    last_name: lastName,
                    gender: gender,
                    email: email,
                    user_name: userName,
                    password: password,
                    user_type:'patient',
                })
                    .then(res => {
                        navigate("/account/login")
                    })
                    .catch(err => {
                        errorAlert(err)
                    })
            }
        }
    }
        return (
            <main className={`${styles.page}`}>
                <section className={`${styles.loginSec} container`}>
                    <h1 className={`w-100 ${styles.registerTitle}`}>Create Account</h1>
                    <div className={`row align-items-center justify-content-center gap-5`}>
                        {/* Register form */}
                        <form className={`col-md-8 col-lg-7 col-sm-8 col-10 ${styles.loginForm}`}>
                            <div className={`${styles.inputRow}`}>
                                <input required onChange={e => setFirstName(e.target.value)} type="text" placeholder="Enter Your First Name" className={styles.input} />
                                <input required onChange={e => setLastName(e.target.value)} type="text" placeholder="Enter Your Last Name" className={styles.input} />
                            </div>
                            <div className={`${styles.inputRow}`}>
                                <input required onChange={e => setEmail(e.target.value)} type="email" placeholder="Enter Your Email" className={styles.input} />
                                <input required onChange={e => setUserName(e.target.value)} type="text" placeholder="Enter Your UserName" className={styles.input} />
                            </div>
                            <div className={`${styles.inputRow}`}>
                                <input required onChange={e => setPassword(e.target.value)} type="password" placeholder="password" className={styles.input} />
                                <input required onChange={e => setConfirmPassword(e.target.value)} type="password" placeholder="confirm password" className={styles.input} />
                            </div>
                            <div className={`${styles.inputRow}`}>
                                <select onChange={e => setGender(e.target.value)} className={`${styles.loginFormInput}`}>
                                    <option defaultValue defaultChecked value="male">Male</option>
                                    <option value="female">Female</option>
                                </select>
                            
                                <select onChange={() => setIsDoctor(!isDoctor)} className={`${styles.loginFormInput}`}>
                                    <option defaultValue defaultChecked value="patient">Patient</option>
                                    <option value="doctor">Doctor</option>
                                </select>
                            
                            </div>
                            {isDoctor &&
                                <div className={`${styles.inputRow}`}>
                                    <input required onChange={e => setSpecialist(e.target.value)} type="text" placeholder="Specialization" className={styles.input} />
                                    <input required onChange={e => setDoctorId(e.target.value)} type="number" placeholder="Your ID" className={styles.input} />
                                </div>
                            }
                            <button onClick={handelRegister}>Create Account</button>
                            <p>Already have Account ?<Link to="/account/login">Login</Link></p>
                        </form>
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
