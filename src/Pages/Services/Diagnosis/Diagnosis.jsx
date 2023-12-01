/* eslint-disable no-unused-vars */
import Multiselect from "multiselect-react-dropdown";
import styles from "./Diagnosis.module.css";
import { useState } from "react";
import Symptoms from "./Symptoms";

import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import DocCard from "./DocCard";
import axios from "axios";

function Diagnosis() {

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
      // handel api call
      try {
        // call back-end api
        let response = await axios.post("http://127.0.0.1:8000/api/diagnose", {
          symptoms: symptoms,
        });
        // success alert
        success();
        // set the disease 
        setDisease(response.data);
        // show the disease and the doctors
        setIsResponse(true)

      } catch (err) {
        // api error
        apiError(err.message)
      }
    }
  };

  return (
    <>
      <main className={`${styles.page}`}>
        <h1 className={`${styles.secTitle}`}>what do you feel ?</h1>
        <section className={`${styles.symptoms}  container`}>
          <Multiselect
            isObject={false}
            onKeyPressFn={function noRefCheck() {}}
            onRemove={(value) => {
              setSymptoms(value);
            }}
            onSearch={function noRefCheck() {}}
            onSelect={(value) => {
              setSymptoms(value);
            }}
            options={[
              "fatigue",
              "weight_loss",
              "lethargy",
              "irregular_sugar_level",
              "blurred_and_distorted_vision",
              "obesity",
              "excessive_hunger",
              "increased_appetite",
              "polyuria",
            ]}
            placeholder="Enter The Symptoms"
            style={{
              chips: {
                background: "var(--secondary-main)",
              },
            }}
          />
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
          {isResponse && (
            <div className={`${styles.results}`}>
              <p>
                You might have :{"  "}
                <span className={`text-warning`}>{disease.Disease}</span>
              </p>
              <p className={`text-secondary`}>{disease.Description}</p>
            </div>
          )}
        </section>
        {isResponse && (
          <>
            <section className={`${styles.doctors}`}>
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
