/* eslint-disable no-unused-vars */
import Multiselect from "multiselect-react-dropdown";
import styles from "./Diagnosis.module.css";
import { useEffect, useRef, useState } from "react";
import { Symptoms, arSymptoms } from "./Symptoms";

import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import DocCard from "./DocCard";
import axios from "axios";
import ReponseSkeleton from "./ReponseSkeleton";


function Diagnosis() {

  console.log(Symptoms.length,arSymptoms.length);
  const [selectOptions,setSelectOptions] = useState([]);
  const [lang, setLang] = useState("en")
  // Check th Lang
  useEffect(() => {
    if (lang === "ar") {
      setSelectOptions(arSymptoms);
    } else {
      setSelectOptions(Symptoms);
    }
  }, [lang])
  
  //ref the multiSelect
  const multiSelect = useRef()
  
  const [isLoading, setIsLoading] = useState(false)
  const [symptoms, setSymptoms] = useState([]);
  const [isResponse, setIsResponse] = useState(false)
  const [disease, setDisease] = useState({})

  // alerts
    const error = () => toast.error("No symptoms selected !"); // if the select is empty
    const apiError = (e) => toast.error(e); // if there is error from tha api
    const success = () => toast.success("Success"); // if the api call has done successfully
    
  const handelSubmit = async () => {
    // check if the select is empty
    if (symptoms.length === 0) {
      error();
    } else {
      if (lang === "ar") {
        // handel loading
        setIsLoading(true)
        // Get the english version of the Symptoms
        console.log(symptoms);
        let enSymptoms = []
        symptoms.forEach(symptom => {
          let index = arSymptoms.indexOf(symptom)
          console.log(index);
          let enSymptom = Symptoms[index]
          enSymptoms.push(enSymptom)
          console.log(enSymptoms);
        })
        try {
          // call back-end api
          let response = await axios.post("http://127.0.0.1:8000/api/diagnose", {
            symptoms: enSymptoms.join(", "),
            lang
          });
          // success alert
          success();

          console.log('====================================');
          console.log(response.data);
          console.log('====================================');

          // set the disease 
          setDisease(response.data);

          // show the disease and the doctors
          setIsResponse(true)

        } catch (err) {
          // api error
          apiError(err.message)
        }
      } else {
        try {
          
          //handel loading
          setIsLoading(true);

          // call back-end api
          let response = await axios.post("http://127.0.0.1:8000/api/diagnose", {
            symptoms: symptoms.join(", "),
            lang
          });
          // success alert
          success();
  
          console.log('====================================');
          console.log(response.data);
          console.log('====================================');
  
          // set the disease 
          setDisease(response.data);
  
          // show the disease and the doctors
          setIsResponse(true)
  
        } catch (err) {
          // api error
          apiError(err.message)
        }
      }
    }
  };

  return (
    <>
      <main className={`${styles.page}`}>
        <h1 className={`${styles.secTitle}`}>what do you feel ?</h1>

        {/* select to change thef lang */}
        <section className={`${styles.symptoms}  container`}>        
          <Multiselect
            ref={multiSelect}
            isObject={false}
            onKeyPressFn={function noRefCheck() {}}
            onRemove={(value) => {
              setSymptoms(value);
            }}
            onSearch={function noRefCheck() {}}
            onSelect={(value) => {
              setSymptoms(value);
            }}
            options={selectOptions}
            placeholder="Enter The Symptoms"
            style={{
              chips: {
                background: "var(--secondary-main)",
              },
            }}
          />
          <div className="language d-flex gap-3">
            <label>Select Language : {" "}</label>
            <select onChange={e => {
              setLang(e.target.value)
              multiSelect.current.resetSelectedValues() // reset the selected symptoms
              setSymptoms([]) // reset the selected Symptoms
              setIsResponse(false) // set the response to false to remove response sec
              setIsLoading(false) // reset loading
            }}>
              <option defaultValue value="en">English</option>
              <option value="ar">Arabic</option>
            </select>
          </div>
          <button className={`${styles.submitBtn}`} onClick={handelSubmit}>
            Submit
          </button>
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

          {isLoading && !isResponse &&(
            <ReponseSkeleton/>
          )}

          {/* Arabic Response */}
          {isResponse && lang === "ar" && (
            <div className={`${lang === "ar" && styles.rtl}`} >
              <div
                className={`${styles.results} d-flex gap-2 gap-md-5 flex-wrap`}
              >
                <h5>
                  التشخيص :{"  "}
                  <span className={`text-danger`}>{disease.ar_Disease}</span>
                </h5>
                <h5>
                  التخصص :{"  "}
                  <span className={`text-danger`}>{disease.ar_Spcialist}</span>
                </h5>
              </div>
              <h5 className={`text-primary ${styles.precaution}`}>
                الاحتياطات
              </h5>
              <div className={`d-flex gap-3 flex-wrap`}>
                {disease.ar_Precautions.map((precaution, i) => {
                  if(precaution === null){
                    return (
                      <span key={i}>
                      </span>
                    )
                  }
                  return (
                    <span className={`text-warning`} key={i}>
                      {`${i + 1} - ${precaution}`}
                    </span>
                  )
                }
                )}
              </div>
              <p className={`text-secondary mt-4 fw-bold`}>{disease.ar_Description}</p>
            </div>
          )}

          {/* English Response */}
          {isResponse && (
            <>
              <div
                className={`${styles.results} d-flex gap-2 gap-md-5 flex-wrap`}
              >
                <h5>
                  Diagnosis :{"  "}
                  <span className={`text-danger`}>{disease.Disease}</span>
                </h5>
                <h5>
                  Spcialist :{"  "}
                  <span className={`text-danger`}>{disease.Spcialist}</span>
                </h5>
              </div>
              <h5 className={`text-primary ${styles.precaution}`}>
                Precautions
              </h5>
              <div className={`d-flex gap-3 flex-wrap`}>
                {disease.Precautions.map((precaution, i) => {
                  if (precaution === null) {
                    return (
                      <span key={i}>
                      </span>
                    )
                  }
                  return (
                    <span className={`text-warning`} key={i}>
                      {`${i + 1} - ${precaution}`}
                    </span>
                  )
                }
                )
                }
              </div>
              <p className={`text-secondary mt-4`}>{disease.Description}</p>
            </>
          )}
        </section>
        {isResponse && (
          <>
            <section dir="rtl" className={`${styles.doctors}`}>
              <div className={`container py-4`}>
                <div className={`row m-0 justify-content-center gap-4 mt-4`}>
                  <DocCard
                    name="lorem ipsum .."
                    spec="lorem lorem"
                    exp={4}
                    rate={3.5}
                    price={350}
                    path="/"
                  />
                  <DocCard
                    name="lorem ipsum .."
                    spec="lorem lorem"
                    exp={4}
                    rate={3.5}
                    price={350}
                    path="/"
                  />
                  <DocCard
                    name="lorem ipsum .."
                    spec="lorem lorem"
                    exp={4}
                    rate={3.5}
                    price={350}
                    path="/"
                  />
                </div>
              </div>
            </section>
          </>
        )}
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
      </main>
    </>
  );
}

export default Diagnosis;
