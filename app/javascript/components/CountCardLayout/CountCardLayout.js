import React from "react";
import PropTypes from "prop-types";
import styles from "./CountCardLayout.module.css"

const CountCardLayout = ({ children }) => (
  <div className={styles.countCardLayout}>{children}</div>
);

CountCardLayout.propTypes = {
  children: PropTypes.node.isRequired,
};

export default CountCardLayout;
