import styled, { css } from "styled-components";

interface ButtonProps {
  label: string;
  onClick?: () => void;
  size: "small" | "medium" | "large";
}

const StyledButton = styled.button<ButtonProps>`
  /* 공통 스타일 */
  border-radius: 30rem;
  cursor: pointer;

  /* 사이즈별 스타일 */
  ${(props) =>
    props.size === "small" &&
    css`
      width: 10rem;
      height: 3.3rem;
      font-size: 12px;
      font-weight: "Bold";
      box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
      background: rgb(255, 159, 238);
      background: linear-gradient(
        0deg,
        rgba(255, 159, 238, 1) 0%,
        rgba(208, 149, 236, 1) 81%
      );
      color: "white";
      border: transparent;

      &:hover {
        background-color: var(--color-gray-01);
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
      }
    `}

  ${(props) =>
    props.size === "medium" &&
    css`
      width: 13.8rem;
      height: 3.6rem;
      font-size: 2rem;
      font-weight:;
      color: white;
      border-color: transparent;
      border-style: solid;
      background-color:;
      box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

      &:hover {
        background-color:;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
      }
    `}

  ${(props) =>
    props.size === "large" &&
    css`
      width: 17.1rem;
      height: 4.2rem;
      font-size: 2.2rem;
      font-weight: bold;
      color: var(--color-white);
      border-color: transparent;
      border-style: solid;
      background: rgb(255, 159, 238);
      background: linear-gradient(
        0deg,
        rgba(255, 159, 238, 1) 0%,
        rgba(208, 149, 236, 1) 81%
      );
      box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);

      &:hover {
        background-color: gray;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
      }
    `}
`;

const Button: React.FC<ButtonProps> = ({ label, onClick, size }) => {
  return (
    <StyledButton size={size} onClick={onClick}>
      {label}
    </StyledButton>
  );
};

export default Button;
