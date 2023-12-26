/* eslint-disable react/prop-types */
import { Link } from 'react-router-dom'
import styles from './BlogRow.module.css'

function BlogCard(props) {
    return (
        <div className={`${styles.blogWraper}  col-md-3 col-sm-6 col-11 p-2`}>
            <div className={`${styles.blogCard}`}>
                <img src={props.img} alt="Blog Image" />
                <h4 className="">
                    {`${props.title.slice(0,15)} ...`}
                </h4>
                <div className={`${styles.details} d-flex gap-1 `}>
                    <span className={`${styles.category}`}>{props.cat ? props.cat : "health-care"}</span>
                    <Link to={`/${props.id}`} className={`${styles.readMore}`}>
                        Read More
                    </Link>
                </div>
            </div>
        </div>
    )
}

export default BlogCard