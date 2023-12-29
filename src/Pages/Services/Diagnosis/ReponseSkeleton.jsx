import styles from "./Diagnosis.module.css"
import Skeleton from 'react-loading-skeleton'
import 'react-loading-skeleton/dist/skeleton.css'
export default function ReponseSkeleton() {
return (
    <>
        <div
            className={`${styles.results} d-flex gap-2 gap-md-5 flex-wrap`}
        >
            <h5 className="">
                Diagnosis :{"  "}
                <Skeleton/>
            </h5>
            <h5>
                Spcialist :{"  "}
                <span className={`text-danger`}><Skeleton/></span>
            </h5>
        </div>
        <h5 className={`text-primary ${styles.precaution}`}>
            Precautions
            <Skeleton className="mt-3"/>
        </h5>
        <div className={`d-flex gap-3 flex-wrap`}>
            <Skeleton/>
        </div>
        <p className={`text-secondary mt-1`}>
            <p className="text-primary fs-5 fw-bold">Description : </p>
            <Skeleton count={3} />
        </p>
    </>
)
}
