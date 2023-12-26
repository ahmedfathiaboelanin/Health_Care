/* eslint-disable no-unused-vars */
import { Link } from "react-router-dom";
import blogImg from "../../assets/blog.jpeg";
import BlogsRow from "./BlogsRow/BlogsRow";
import styles from "./Blogs.module.css";
import fakeData from "./fakeData"
import { useState } from "react";
import { FaSearch } from "react-icons/fa";
import { IoClose } from "react-icons/io5";
function Blogs() {
    const [clickSearch, setClickSearch] = useState(false)
    return (
        <>
            <main className={`${styles.page}`}>
                <section className={`container ${styles.featured}`}>
                    <div className="d-flex overflow-hidden justify-content-between align-items-center mb-3 flex-wrap">
                        <div className="d-flex gap-4 align-items-center">
                            <h3>Featured</h3>
                            <button className={styles.searchBtn} onClick={() => {
                                setClickSearch(!clickSearch)
                            }}>
                                {clickSearch ? <IoClose /> : <FaSearch />}
                            </button>
                        </div>
                        <input type="search" placeholder="Search ..." className={`${styles.searchInput} ${clickSearch? styles.show: styles.hide}`} />
                    </div>
                    <div className={`${styles.cardsContainer}`}>
                        <div className={`${styles.card} ${styles.bigCard}`}>
                            <div className={`${styles.layer}`}></div>
                            <img src={blogImg} alt="blog img" />
                        </div>
                        <div className={`${styles.card} ${styles.card1} bg-warning`}>
                            <div className={`${styles.layer}`}></div>
                            <img src={blogImg} alt="blog img" />
                        </div>
                        <div className={`${styles.card} ${styles.card2} bg-danger`}>
                            <div className={`${styles.layer}`}></div>
                            <img src={blogImg} alt="blog img" />
                        </div>
                        <div
                            className={`${styles.card} ${styles.horizonCard} bg-success`}
                        >
                            <div className={`${styles.layer}`}></div>
                            <img src={blogImg} alt="blog img" />
                        </div>
                    </div>
                </section>
                <section className={`container mt-5`}>
                    <BlogsRow data = {fakeData} path="/blog" img={blogImg} secTiltle="Medicine" />
                    <BlogsRow data = {fakeData} path="/blog" img={blogImg} secTiltle="Health-Care" />
                </section>
            </main>
        </>
    );
}

export default Blogs;
