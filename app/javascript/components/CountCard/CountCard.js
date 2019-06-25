import React from "react";
import PropTypes from "prop-types";
import classnames from "classnames";
import styles from "./CountCard.module.css";

const CountCard = ({ title, count }) => (
  <div className={styles.countCard}>
    <span className={classnames(styles.inlineBlock, styles.title)}>{title}</span>
    <div className={styles.count}>
      <span className={styles.inlineBlock}>{count}</span>
    </div>
  </div>
);

CountCard.propTypes = {
  title: PropTypes.string.isRequired,
  count: PropTypes.number,
};

CountCard.defaultProps = {
  count: 0,
};

export default CountCard;
