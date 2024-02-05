/* eslint-disable no-unused-vars */
import styles from "./HeartFailure.module.css"
import { useContext, useEffect, useRef, useState } from "react";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import axios from "axios";
import { Link } from "react-router-dom";
import ReponseSkeleton from "./ResponseSkeleton";
export default function HeartFailure() {

    const [age, setAge] = useState(null)
    const [sex, setSex] = useState("M")
    const [chestPainType, setChestPainType] = useState("TA")
    const [restingBP, setRestingBP] = useState(null)
    const [cholesterol, setCholesterol] = useState(null)
    const [fastingBS, setFastingBS] = useState(0)
    const [restingECG, setRestingECG] = useState("Normal")
    const [maxHR, setMaxHR] = useState(156)
    const [exerciseAngina, setExerciseAngina] = useState("N")
    const [oldpeak, setOldpeak] = useState(1)
    const [ST_Slope, setST_Slope] = useState("Flat")
    const [result, setResult] = useState(null)
    const [loading, setLoading] = useState(false)
    const handelPredict = async (e) => { 
        e.preventDefault()
        if (age === null || sex === null || chestPainType === null || restingBP === null || cholesterol === null || fastingBS === null || restingECG === null || maxHR === null || exerciseAngina === null || oldpeak === null || ST_Slope === null) { 
            toast.error("All fields are required")
        } else {
            setResult(null)
            setLoading(true)
            try {
                let response = await axios.post("http://127.0.0.1:8000/api/heart-failure", {
                    "data": {
                        "Age": age,
                        "Sex": sex,
                        "ChestPainType": chestPainType,
                        "RestingBP": restingBP,
                        "Cholesterol": cholesterol,
                        "FastingBS": +fastingBS,
                        "RestingECG": restingECG,
                        "MaxHR": maxHR,
                        "ExerciseAngina": exerciseAngina,
                        "Oldpeak": oldpeak,
                        "ST_Slope": ST_Slope
                    }
                })
                console.log('====================================');
                console.log(response.data);
                console.log('====================================');
                setResult(response.data.prediction)
                toast.success("Success")
                setLoading(false)
            } catch {
                toast.error("Something went wrong")
                setLoading(false)
            }
        }
    }

    return (
        <main className={`${styles.page}`}>
            <section className={`${styles.sec} container`}>
                <h1 className={`w-100 ${styles.registerTitle}`}>Heart Failure Prediction Service</h1>
                <div className={`row align-items-center justify-content-center gap-5`}>
                    {/* form */}
                    <form className={`col-md-8 col-lg-7 col-sm-8 col-10 ${styles.form}`}>
                        <div className={`${styles.inputRow}`}>
                            <input  onChange={(e) => setAge(e.target.value)} required type="number" placeholder="Enter Your Age" className={styles.input} />
                            <select onChange={(e) => setSex(e.target.value)} className={`${styles.select}`}>
                                <option defaultValue defaultChecked value="M">Male</option>
                                <option value="F">Female</option>
                            </select>
                        </div>

                        <div className={`${styles.inputRow}`}>
                            <select onChange={(e) => setChestPainType(e.target.value)} className={`${styles.select}`}>
                                <option disabled defaultChecked value="TA">Chest-Pain-Type</option>
                                <option value="TA">Typical-Angina</option>
                                <option value="ATA">Atypical-Angina</option>
                                <option value="NAP">Non-Anginal-Pain</option>
                                <option value="ASY">Asymptomatic</option>
                            </select>

                            <select onChange={(e) => setFastingBS(e.target.value)} className={`${styles.select}`}>
                                <option disabled  value="1">Fasting-Blood-Sugar {'>'}120</option>
                                <option  value="1">Bigger than 120 mg/dl</option>
                                <option value="0">Otherwise</option>
                            </select>

                        </div>

                        <div className={`${styles.inputRow}`}>
                            <input onChange={(e) => setRestingBP(e.target.value)} required type="number" placeholder="Resting Blood Pressure mm/Hg" className={styles.input} />
                            <input onChange={(e) => setCholesterol(e.target.value)} required type="number" placeholder="Colesterol mm/dl" className={styles.input} />
                        </div>

                        <div className={`${styles.inputRow}`}>
                            <select onChange={(e) => setRestingECG(e.target.value)} className={`${styles.select}`}>
                                <option value="Normal">Resting Electrocardiogram [Normal]</option>
                                <option value="ST">ST</option>
                                <option value="LVH">LVH</option>
                            </select>
                            <input onChange={(e) => setMaxHR(e.target.value)} required type="number" placeholder="Maximum Heart Rate [60 - 202]" className={styles.input} />
                        </div>

                        <div className={`${styles.inputRow}`}>
                            <select onChange={(e) => setExerciseAngina(e.target.value)} className={`${styles.select}`}>
                                <option value="Y">Exercise-induced-angina {'[Yes]'}</option>
                                <option value="N">No</option>
                            </select>

                            <input onChange={(e) => setOldpeak(e.target.value)} required type="number" placeholder="Oldpeak " className={styles.input} />
                        </div>

                        <div className={`${styles.inputRow}`}>
                            <select onChange={(e) => setST_Slope(e.target.value)} className={`${styles.select}`}>
                                <option value="Up">ST-Slope {' [Up] '}</option>
                                <option value="Flat">Flat</option>
                                <option value="Down">Down</option>
                            </select>
                        </div>
                        
                        <button onClick={handelPredict}>Predict</button>
                    </form>

                    {/* result */}
                    {result == 1 && <p className={`col-md-8 col-lg-7 col-sm-8 col-10 ${styles.result}`}>
                        Based on our analysis, {"it's"} important for you to consult with a healthcare professional
                        . The results indicate a potential concern, and {"it's"} recommended that you schedule an appointment with your doctor to discuss the findings in more detail.
                        Early detection and professional guidance are essential for your well-being.</p>}
                    {result == 0 && <p className={`col-md-8 col-lg-7 col-sm-8 col-10 ${styles.result}`}>Normal</p>}

                    {/* skeleton */}
                    {result == null && loading && <ReponseSkeleton />}

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
