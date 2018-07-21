module data.tensor;



struct Tensor {
    double[][] data;

    /++
        Constructor of single row(true) or column(false)
    +/
    this(double[] vec, bool byRow = true) {
        if (byRow) {
            this.data.length = 1;
            this.data[0] = vec[]; // Copy
        } else {
            this.data.length = vec.length;
            foreach(i, ref rows; this.data) {
                rows.length = 1;
                rows[0] = vec[i];
            }
        }
    }

    /++
        Constructor with array of array
    +/
    this(double[][] mat) {
        this.data.length = mat.length;
        foreach(i, ref rows; this.data) {
            rows = mat[i][]; // Copy, not ref
        }
    }

    /++
        Initialize with single number
    +/
    this(double val, long row, long col) {
        this.data.length = row;
        foreach(i, ref rows; this.data) {
            rows.length = col;
            foreach(j; 0 .. col) {
                rows[j] = val;
            }
        }
    }

    /++
        Empty Matrix
    +/
    this(long row, long col) {
        this.data.length = row;
        foreach(i, ref rows; this.data) {
            rows.length = col;
        }
    }

    /++
        Return row (Same as R)
    +/
    auto nrow() const {
        return this.data.length;
    }

    /++
        Return col (Same as R)
    +/
    auto ncol() const {
        return this.data[0].length;
    }
}