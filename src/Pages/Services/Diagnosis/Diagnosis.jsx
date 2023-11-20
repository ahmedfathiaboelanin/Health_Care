/* eslint-disable no-unused-vars */
import Multiselect from "multiselect-react-dropdown";
import "./Diagnosis.css";
import { useState } from "react";
import Symptoms from "./Symptoms";

import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import DocCard from "./DocCard";
import { Link } from "react-router-dom";
import { BsArrowRight } from "react-icons/bs";

function Diagnosis() {
  const [symptoms, setSymptoms] = useState([]);
  const [isResponse,setIsResponse] =useState(false)
  const error = () => toast.error("No symptoms selected !");
  const success = () => toast.success("Success");
  const handelSubmit = () => {
    if (symptoms.length === 0) {
      error();
    } else {
      success();
      setIsResponse(true)
      console.log(symptoms);
    }
  };

  return (
    <>
      <main className="page">
        <h1 className="secTitle">what do you feel ?</h1>
        <section className="symptoms container">
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
            options={Symptoms}
            placeholder="Enter The Symptoms"
            style={{
              chips: {
                background: "var(--secondary-main)",
              },
            }}
          />
          <button className="submit-btn" onClick={handelSubmit}>
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
            <div className="results">
              <p>
                rem quas ad adipisci repellendus ab doloribus nulla ipsam soluta
              </p>
            </div>
          )}
        </section>
        {isResponse && (
          <>
            <section className="doctors">
              <div className="container py-4">
                {/* <div className="docSechead">
                  <h3 className="">Recommended Doctors</h3>
                  <Link to="/">
                    {" "}
                    <BsArrowRight /> See All Doctors
                  </Link>
                </div> */}
                <div className="row m-0 justify-content-center gap-4 mt-4">
                  <DocCard name="lorem ipsum .." spec="lorem lorem" exp={ 4 } rate={3.5} price={350} path="/" />
                  <DocCard name="lorem ipsum .." spec="lorem lorem" exp={ 4 } rate={3.5} price={350} path="/" />
                  <DocCard name="lorem ipsum .." spec="lorem lorem" exp={ 4 } rate={3.5} price={350} path="/" />
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
          className="svg-circle d-none d-md-block"
        >
          <circle opacity="0.5" cx="500" cy="500" r="500" fill="#B3E5FC" />
        </svg>
      </main>
    </>
  );
}

export default Diagnosis;
