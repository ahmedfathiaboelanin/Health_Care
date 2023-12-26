/* eslint-disable react/prop-types */
import { Link } from "react-router-dom"
import styles from "./BlogRow.module.css"
import BlogCard from "./BlogCard"

function BlogsRow(props) {
    return (
        <>
            <div className="d-flex justify-content-between mt-5">
                <h3>{ props.secTiltle }</h3>
                <Link to={props.path} className="">
                    View all
                </Link>
            </div>
            <div className={`${styles.blogsRow} row`}>
                {props.data.map( (blog) => {
                    return <BlogCard key={blog.id} id={blog.id} title={blog.title} img={props.img} />
                })}
            </div>
        </>
    )
}

export default BlogsRow