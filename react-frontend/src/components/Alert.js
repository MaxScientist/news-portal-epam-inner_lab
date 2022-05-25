import style from "./style.module.css";
import css from "classnames";
import React from "react";

export default function Alert({ children, type, message }) {

    const renderElAlert = function () {
        return React.cloneElement(children);
    };

    return (
        <div className={css(style.alert, style[type])}>
      <span className={style.closebtn}>
        &times;
      </span>
            {children ? renderElAlert() : message}
        </div>
    );
}