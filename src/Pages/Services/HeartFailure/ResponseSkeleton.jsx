import Skeleton, { SkeletonTheme } from 'react-loading-skeleton'
import 'react-loading-skeleton/dist/skeleton.css'
export default function ReponseSkeleton() {
    return (
        <>
            <SkeletonTheme baseColor="#0077AA" highlightColor="#B3E5FC">
                <p className={`col-md-8 col-lg-7 col-sm-8 col-10 text-secondary mt-1`}>
                    <Skeleton count={3} />
                </p>
            </SkeletonTheme>
        </>
    )
}
